; DESCRIPTION: Draws a black line from (71, 9) to (103, 178).
; PLAN: r0=71(x1), r1=9(y1), r2=103(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 9
LDI r2, 103
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
