; DESCRIPTION: Places a yellow 105x63 rectangle at position (220, 183).
; PLAN: r0=220(x), r1=183(y), r2=105(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 183
LDI r2, 105
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
