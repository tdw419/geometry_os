; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (107, 70) to (222, 228). Then Renders a yellow box of size 11x75 starting at (55, 28).
; PLAN: r0=107(x1), r1=70(y1), r2=222(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=55(x), r1=28(y), r2=11(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta line segment connecting (107, 70) to (222, 228).
; PLAN: r0=107(x1), r1=70(y1), r2=222(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 70
LDI r2, 222
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow box of size 11x75 starting at (55, 28).
; PLAN: r0=55(x), r1=28(y), r2=11(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 28
LDI r2, 11
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
