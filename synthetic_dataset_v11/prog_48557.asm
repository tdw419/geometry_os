; DESCRIPTION: Places a magenta line segment connecting (168, 251) to (242, 30).
; PLAN: r0=168(x1), r1=251(y1), r2=242(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 251
LDI r2, 242
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
