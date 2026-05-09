; DESCRIPTION: Draws a black line from (214, 29) to (130, 150).
; PLAN: r0=214(x1), r1=29(y1), r2=130(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 29
LDI r2, 130
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
