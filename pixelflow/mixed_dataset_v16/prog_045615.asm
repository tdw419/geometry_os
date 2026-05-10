; DESCRIPTION: Renders a yellow box of size 63x32 starting at (417, 198).
; PLAN: r0=417(x), r1=198(y), r2=63(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 198
LDI r2, 63
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
