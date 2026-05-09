; DESCRIPTION: Draws a white line from (107, 146) to (46, 189).
; PLAN: r0=107(x1), r1=146(y1), r2=46(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 146
LDI r2, 46
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
