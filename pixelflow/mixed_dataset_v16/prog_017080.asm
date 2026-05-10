; DESCRIPTION: Places a yellow 43x63 rectangle at position (402, 4).
; PLAN: r0=402(x), r1=4(y), r2=43(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 4
LDI r2, 43
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
