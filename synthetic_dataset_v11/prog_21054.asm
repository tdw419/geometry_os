; DESCRIPTION: Draws a black line from (130, 189) to (53, 154).
; PLAN: r0=130(x1), r1=189(y1), r2=53(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 189
LDI r2, 53
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
