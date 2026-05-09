; DESCRIPTION: Composite: . Then Places a red line segment connecting (179, 140) to (157, 207). Then Draws a blue circle centered at (70, 228) with radius 12.
; PLAN: r0=179(x1), r1=140(y1), r2=157(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=70(x), r1=228(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red line segment connecting (179, 140) to (157, 207).
; PLAN: r0=179(x1), r1=140(y1), r2=157(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 140
LDI r2, 157
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (70, 228) with radius 12.
; PLAN: r0=70(x), r1=228(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 228
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
