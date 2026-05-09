; DESCRIPTION: Composite: . Then Places a purple line segment connecting (156, 196) to (161, 132). Then Places a orange 97x75 rectangle at position (152, 85).
; PLAN: r0=156(x1), r1=196(y1), r2=161(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=152(x), r1=85(y), r2=97(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple line segment connecting (156, 196) to (161, 132).
; PLAN: r0=156(x1), r1=196(y1), r2=161(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 196
LDI r2, 161
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange 97x75 rectangle at position (152, 85).
; PLAN: r0=152(x), r1=85(y), r2=97(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 85
LDI r2, 97
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
