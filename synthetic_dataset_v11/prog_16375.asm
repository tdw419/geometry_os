; DESCRIPTION: Composite: . Then Places a orange line segment connecting (126, 204) to (104, 251). Then Renders a purple box of size 69x63 starting at (179, 86).
; PLAN: r0=126(x1), r1=204(y1), r2=104(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=179(x), r1=86(y), r2=69(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange line segment connecting (126, 204) to (104, 251).
; PLAN: r0=126(x1), r1=204(y1), r2=104(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 204
LDI r2, 104
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple box of size 69x63 starting at (179, 86).
; PLAN: r0=179(x), r1=86(y), r2=69(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 86
LDI r2, 69
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
