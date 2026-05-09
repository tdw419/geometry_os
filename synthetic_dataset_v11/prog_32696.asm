; DESCRIPTION: Composite: . Then Places a blue line segment connecting (49, 255) to (193, 141). Then Places a magenta 97x117 rectangle at position (134, 83).
; PLAN: r0=49(x1), r1=255(y1), r2=193(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=134(x), r1=83(y), r2=97(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue line segment connecting (49, 255) to (193, 141).
; PLAN: r0=49(x1), r1=255(y1), r2=193(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 255
LDI r2, 193
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta 97x117 rectangle at position (134, 83).
; PLAN: r0=134(x), r1=83(y), r2=97(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 83
LDI r2, 97
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
