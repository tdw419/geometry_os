; DESCRIPTION: Places a green 38x63 rectangle at position (132, 172).
; PLAN: r0=132(x), r1=172(y), r2=38(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 172
LDI r2, 38
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
