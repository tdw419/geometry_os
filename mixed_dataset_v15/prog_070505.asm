; DESCRIPTION: Places a green 58x105 rectangle at position (63, 3).
; PLAN: r0=63(x), r1=3(y), r2=58(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 3
LDI r2, 58
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
