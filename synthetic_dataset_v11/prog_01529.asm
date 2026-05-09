; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (87, 45) to (50, 243). Then Creates a purple rectangular region at (52, 104) spanning 36 by 15 pixels.
; PLAN: r0=87(x1), r1=45(y1), r2=50(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=52(x), r1=104(y), r2=36(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta line segment connecting (87, 45) to (50, 243).
; PLAN: r0=87(x1), r1=45(y1), r2=50(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 45
LDI r2, 50
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple rectangular region at (52, 104) spanning 36 by 15 pixels.
; PLAN: r0=52(x), r1=104(y), r2=36(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 104
LDI r2, 36
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
