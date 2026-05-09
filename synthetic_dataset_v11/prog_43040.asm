; DESCRIPTION: Draws a green line from (105, 204) to (187, 52).
; PLAN: r0=105(x1), r1=204(y1), r2=187(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 204
LDI r2, 187
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
