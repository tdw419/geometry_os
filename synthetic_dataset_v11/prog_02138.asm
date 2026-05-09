; DESCRIPTION: Places a green line segment connecting (92, 197) to (120, 130).
; PLAN: r0=92(x1), r1=197(y1), r2=120(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 197
LDI r2, 120
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
