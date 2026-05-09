; DESCRIPTION: Draws a green line from (69, 45) to (285, 25).
; PLAN: r0=69(x1), r1=45(y1), r2=285(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 45
LDI r2, 285
LDI r3, 25
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
