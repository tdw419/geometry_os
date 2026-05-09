; DESCRIPTION: Renders a red box of size 110x99 starting at (217, 32).
; PLAN: r0=217(x), r1=32(y), r2=110(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 32
LDI r2, 110
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
