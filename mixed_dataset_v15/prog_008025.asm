; DESCRIPTION: Draws a white line from (336, 213) to (70, 137).
; PLAN: r0=336(x1), r1=213(y1), r2=70(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 213
LDI r2, 70
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
