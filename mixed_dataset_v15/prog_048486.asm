; DESCRIPTION: Renders a magenta line between points (248, 44) and (295, 10).
; PLAN: r0=248(x1), r1=44(y1), r2=295(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 44
LDI r2, 295
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
