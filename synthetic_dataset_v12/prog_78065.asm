; DESCRIPTION: Places a magenta line segment connecting (236, 242) to (462, 255).
; PLAN: r0=236(x1), r1=242(y1), r2=462(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 242
LDI r2, 462
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
