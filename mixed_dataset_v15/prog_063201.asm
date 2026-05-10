; DESCRIPTION: Renders a black box of size 45x33 starting at (57, 157).
; PLAN: r0=57(x), r1=157(y), r2=45(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 157
LDI r2, 45
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
