; DESCRIPTION: Draws a black line from (171, 244) to (9, 83).
; PLAN: r0=171(x1), r1=244(y1), r2=9(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 244
LDI r2, 9
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
