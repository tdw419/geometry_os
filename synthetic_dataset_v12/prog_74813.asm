; DESCRIPTION: Places a magenta line segment connecting (366, 224) to (209, 146).
; PLAN: r0=366(x1), r1=224(y1), r2=209(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 224
LDI r2, 209
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
