; DESCRIPTION: Draws a white line from (141, 233) to (126, 46).
; PLAN: r0=141(x1), r1=233(y1), r2=126(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 233
LDI r2, 126
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
