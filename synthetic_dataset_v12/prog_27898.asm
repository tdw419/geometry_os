; DESCRIPTION: Renders a black box of size 64x104 starting at (196, 14).
; PLAN: r0=196(x), r1=14(y), r2=64(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 14
LDI r2, 64
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
