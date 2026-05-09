; DESCRIPTION: Renders a cyan line between points (453, 22) and (373, 152).
; PLAN: r0=453(x1), r1=22(y1), r2=373(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 22
LDI r2, 373
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
