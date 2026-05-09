; DESCRIPTION: Places a cyan line segment connecting (369, 105) to (228, 208).
; PLAN: r0=369(x1), r1=105(y1), r2=228(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 105
LDI r2, 228
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
