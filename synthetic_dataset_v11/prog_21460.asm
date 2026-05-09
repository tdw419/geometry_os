; DESCRIPTION: Places a blue 94x36 rectangle at position (63, 21).
; PLAN: r0=63(x), r1=21(y), r2=94(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 21
LDI r2, 94
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
