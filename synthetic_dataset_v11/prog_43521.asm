; DESCRIPTION: Draws a white line from (242, 125) to (132, 102).
; PLAN: r0=242(x1), r1=125(y1), r2=132(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 125
LDI r2, 132
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
