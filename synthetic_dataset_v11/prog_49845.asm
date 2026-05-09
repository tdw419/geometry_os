; DESCRIPTION: Composite: . Then Renders a white line between points (103, 74) and (201, 98). Then Renders a magenta box of size 20x47 starting at (199, 89).
; PLAN: r0=103(x1), r1=74(y1), r2=201(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=199(x), r1=89(y), r2=20(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white line between points (103, 74) and (201, 98).
; PLAN: r0=103(x1), r1=74(y1), r2=201(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 74
LDI r2, 201
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta box of size 20x47 starting at (199, 89).
; PLAN: r0=199(x), r1=89(y), r2=20(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 89
LDI r2, 20
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
