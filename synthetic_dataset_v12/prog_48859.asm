; DESCRIPTION: Draws a white line from (225, 234) to (65, 83).
; PLAN: r0=225(x1), r1=234(y1), r2=65(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 234
LDI r2, 65
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
