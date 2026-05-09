; DESCRIPTION: Renders a cyan line between points (144, 218) and (68, 196).
; PLAN: r0=144(x1), r1=218(y1), r2=68(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 218
LDI r2, 68
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
