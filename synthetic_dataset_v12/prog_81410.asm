; DESCRIPTION: Renders a red box of size 18x75 starting at (201, 32).
; PLAN: r0=201(x), r1=32(y), r2=18(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 32
LDI r2, 18
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
