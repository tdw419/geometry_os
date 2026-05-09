; DESCRIPTION: Draws a black line from (187, 207) to (421, 174).
; PLAN: r0=187(x1), r1=207(y1), r2=421(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 207
LDI r2, 421
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
