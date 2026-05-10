; DESCRIPTION: Draws a white line from (152, 139) to (349, 178).
; PLAN: r0=152(x1), r1=139(y1), r2=349(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 139
LDI r2, 349
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
