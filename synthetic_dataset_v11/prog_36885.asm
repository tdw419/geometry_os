; DESCRIPTION: Composite: . Then Renders a magenta box of size 45x77 starting at (145, 126). Then Places a yellow line segment connecting (146, 81) to (153, 117).
; PLAN: r0=145(x), r1=126(y), r2=45(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=146(x1), r1=81(y1), r2=153(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta box of size 45x77 starting at (145, 126).
; PLAN: r0=145(x), r1=126(y), r2=45(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 126
LDI r2, 45
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow line segment connecting (146, 81) to (153, 117).
; PLAN: r0=146(x1), r1=81(y1), r2=153(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 81
LDI r2, 153
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
