; DESCRIPTION: Draws a yellow line from (262, 152) to (185, 55).
; PLAN: r0=262(x1), r1=152(y1), r2=185(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 152
LDI r2, 185
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
