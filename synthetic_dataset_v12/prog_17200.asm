; DESCRIPTION: Places a blue 98x63 rectangle at position (361, 54).
; PLAN: r0=361(x), r1=54(y), r2=98(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 54
LDI r2, 98
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
