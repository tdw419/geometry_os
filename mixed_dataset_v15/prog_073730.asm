; DESCRIPTION: Places a yellow 13x48 rectangle at position (208, 147).
; PLAN: r0=208(x), r1=147(y), r2=13(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 147
LDI r2, 13
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
