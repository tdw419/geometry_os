; DESCRIPTION: Places a yellow line segment connecting (242, 228) to (169, 23).
; PLAN: r0=242(x1), r1=228(y1), r2=169(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 228
LDI r2, 169
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
