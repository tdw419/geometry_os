; DESCRIPTION: Draws a black line from (69, 163) to (332, 27).
; PLAN: r0=69(x1), r1=163(y1), r2=332(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 163
LDI r2, 332
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
