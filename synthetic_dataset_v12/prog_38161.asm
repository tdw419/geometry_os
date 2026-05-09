; DESCRIPTION: Draws a black line from (290, 171) to (398, 1).
; PLAN: r0=290(x1), r1=171(y1), r2=398(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 171
LDI r2, 398
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
