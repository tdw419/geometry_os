; DESCRIPTION: Places a green line segment connecting (253, 253) to (166, 242).
; PLAN: r0=253(x1), r1=253(y1), r2=166(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 253
LDI r2, 166
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
