; DESCRIPTION: Draws a white line from (86, 223) to (8, 221).
; PLAN: r0=86(x1), r1=223(y1), r2=8(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 223
LDI r2, 8
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
