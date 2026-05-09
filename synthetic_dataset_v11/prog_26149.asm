; DESCRIPTION: Draws a white line from (30, 252) to (209, 55).
; PLAN: r0=30(x1), r1=252(y1), r2=209(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 252
LDI r2, 209
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
