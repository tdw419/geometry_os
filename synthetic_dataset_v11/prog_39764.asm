; DESCRIPTION: Composite: . Then Places a blue 94x14 rectangle at position (75, 233). Then Places a blue line segment connecting (194, 9) to (115, 246).
; PLAN: r0=75(x), r1=233(y), r2=94(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=194(x1), r1=9(y1), r2=115(x2), r3=246(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue 94x14 rectangle at position (75, 233).
; PLAN: r0=75(x), r1=233(y), r2=94(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 233
LDI r2, 94
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue line segment connecting (194, 9) to (115, 246).
; PLAN: r0=194(x1), r1=9(y1), r2=115(x2), r3=246(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 9
LDI r2, 115
LDI r3, 246
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
