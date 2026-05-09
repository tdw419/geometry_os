; DESCRIPTION: Renders a red box of size 39x81 starting at (207, 3).
; PLAN: r0=207(x), r1=3(y), r2=39(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 3
LDI r2, 39
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
