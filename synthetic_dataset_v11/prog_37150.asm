; DESCRIPTION: Composite: . Then Places a white line segment connecting (18, 208) to (93, 14). Then Places a green 31x79 rectangle at position (113, 39).
; PLAN: r0=18(x1), r1=208(y1), r2=93(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=113(x), r1=39(y), r2=31(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white line segment connecting (18, 208) to (93, 14).
; PLAN: r0=18(x1), r1=208(y1), r2=93(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 208
LDI r2, 93
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green 31x79 rectangle at position (113, 39).
; PLAN: r0=113(x), r1=39(y), r2=31(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 39
LDI r2, 31
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
