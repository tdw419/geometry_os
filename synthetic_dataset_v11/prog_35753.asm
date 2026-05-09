; DESCRIPTION: Renders a magenta line between points (123, 31) and (217, 192).
; PLAN: r0=123(x1), r1=31(y1), r2=217(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 31
LDI r2, 217
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
