; DESCRIPTION: Composite: . Then Places a green 94x23 rectangle at position (94, 37). Then Places a green line segment connecting (40, 110) to (166, 168).
; PLAN: r0=94(x), r1=37(y), r2=94(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=40(x1), r1=110(y1), r2=166(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green 94x23 rectangle at position (94, 37).
; PLAN: r0=94(x), r1=37(y), r2=94(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 37
LDI r2, 94
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green line segment connecting (40, 110) to (166, 168).
; PLAN: r0=40(x1), r1=110(y1), r2=166(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 110
LDI r2, 166
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
