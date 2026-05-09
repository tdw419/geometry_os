; DESCRIPTION: Draws a white line from (395, 212) to (281, 253).
; PLAN: r0=395(x1), r1=212(y1), r2=281(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 212
LDI r2, 281
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
