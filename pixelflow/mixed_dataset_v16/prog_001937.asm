; DESCRIPTION: Renders a black box of size 63x107 starting at (21, 32).
; PLAN: r0=21(x), r1=32(y), r2=63(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 32
LDI r2, 63
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
