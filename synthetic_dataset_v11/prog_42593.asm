; DESCRIPTION: Composite: . Then Places a magenta 54x89 rectangle at position (178, 24). Then Places a yellow line segment connecting (243, 200) to (168, 136).
; PLAN: r0=178(x), r1=24(y), r2=54(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=243(x1), r1=200(y1), r2=168(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta 54x89 rectangle at position (178, 24).
; PLAN: r0=178(x), r1=24(y), r2=54(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 24
LDI r2, 54
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow line segment connecting (243, 200) to (168, 136).
; PLAN: r0=243(x1), r1=200(y1), r2=168(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 200
LDI r2, 168
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
