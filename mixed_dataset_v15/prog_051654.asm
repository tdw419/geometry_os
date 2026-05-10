; DESCRIPTION: Draws a white line from (430, 207) to (264, 55).
; PLAN: r0=430(x1), r1=207(y1), r2=264(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 207
LDI r2, 264
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
