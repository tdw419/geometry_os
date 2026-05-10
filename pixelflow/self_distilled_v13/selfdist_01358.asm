; DESCRIPTION: Places a magenta 13x37 box at position (328, 91).
; PLAN: r0=328(x), r1=91(y), r2=13(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 91
LDI r2, 13
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
