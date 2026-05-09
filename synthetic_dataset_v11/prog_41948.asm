; DESCRIPTION: Places a yellow line segment connecting (202, 245) to (68, 65).
; PLAN: r0=202(x1), r1=245(y1), r2=68(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 245
LDI r2, 68
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
