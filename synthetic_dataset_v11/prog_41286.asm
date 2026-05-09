; DESCRIPTION: Composite: . Then Places a green line segment connecting (25, 150) to (233, 87). Then Creates a purple rectangular region at (94, 58) spanning 114 by 107 pixels.
; PLAN: r0=25(x1), r1=150(y1), r2=233(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=94(x), r1=58(y), r2=114(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green line segment connecting (25, 150) to (233, 87).
; PLAN: r0=25(x1), r1=150(y1), r2=233(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 150
LDI r2, 233
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple rectangular region at (94, 58) spanning 114 by 107 pixels.
; PLAN: r0=94(x), r1=58(y), r2=114(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 58
LDI r2, 114
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
