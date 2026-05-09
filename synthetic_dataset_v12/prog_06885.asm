; DESCRIPTION: Draws a white line from (76, 33) to (328, 55).
; PLAN: r0=76(x1), r1=33(y1), r2=328(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 33
LDI r2, 328
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
