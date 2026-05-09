; DESCRIPTION: Renders a red box of size 102x26 starting at (390, 180).
; PLAN: r0=390(x), r1=180(y), r2=102(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 180
LDI r2, 102
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
