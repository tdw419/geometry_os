; DESCRIPTION: Draws a black line from (277, 192) to (480, 10).
; PLAN: r0=277(x1), r1=192(y1), r2=480(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 192
LDI r2, 480
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
