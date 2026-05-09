; DESCRIPTION: Places a green line segment connecting (152, 129) to (247, 127).
; PLAN: r0=152(x1), r1=129(y1), r2=247(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 129
LDI r2, 247
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
