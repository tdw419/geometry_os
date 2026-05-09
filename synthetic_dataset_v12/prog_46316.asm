; DESCRIPTION: Places a cyan line segment connecting (168, 245) to (318, 17).
; PLAN: r0=168(x1), r1=245(y1), r2=318(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 245
LDI r2, 318
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
