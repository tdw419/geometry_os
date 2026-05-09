; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (150, 33) to (32, 87). Then Renders a yellow box of size 84x71 starting at (50, 74).
; PLAN: r0=150(x1), r1=33(y1), r2=32(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=50(x), r1=74(y), r2=84(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta line segment connecting (150, 33) to (32, 87).
; PLAN: r0=150(x1), r1=33(y1), r2=32(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 33
LDI r2, 32
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow box of size 84x71 starting at (50, 74).
; PLAN: r0=50(x), r1=74(y), r2=84(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 74
LDI r2, 84
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
