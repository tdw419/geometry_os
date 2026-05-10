; DESCRIPTION: Renders a magenta line between points (229, 249) and (482, 92).
; PLAN: r0=229(x1), r1=249(y1), r2=482(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 249
LDI r2, 482
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
