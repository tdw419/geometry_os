; DESCRIPTION: Places a magenta line segment connecting (239, 99) to (21, 146).
; PLAN: r0=239(x1), r1=99(y1), r2=21(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 99
LDI r2, 21
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
