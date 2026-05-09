; DESCRIPTION: Renders a black box of size 72x25 starting at (257, 160).
; PLAN: r0=257(x), r1=160(y), r2=72(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 160
LDI r2, 72
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
