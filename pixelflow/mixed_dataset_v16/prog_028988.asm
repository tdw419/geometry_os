; DESCRIPTION: Draws a black line from (274, 20) to (277, 57).
; PLAN: r0=274(x1), r1=20(y1), r2=277(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 20
LDI r2, 277
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
