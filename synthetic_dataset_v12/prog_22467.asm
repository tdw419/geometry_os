; DESCRIPTION: Renders a black box of size 32x45 starting at (332, 104).
; PLAN: r0=332(x), r1=104(y), r2=32(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 104
LDI r2, 32
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
