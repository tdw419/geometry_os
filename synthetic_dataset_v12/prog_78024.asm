; DESCRIPTION: Renders a black box of size 75x104 starting at (118, 128).
; PLAN: r0=118(x), r1=128(y), r2=75(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 128
LDI r2, 75
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
