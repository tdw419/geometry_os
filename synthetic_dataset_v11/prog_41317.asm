; DESCRIPTION: Renders a red box of size 47x44 starting at (35, 157).
; PLAN: r0=35(x), r1=157(y), r2=47(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 157
LDI r2, 47
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
