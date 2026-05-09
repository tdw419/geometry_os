; DESCRIPTION: Draws a white line from (55, 146) to (166, 167).
; PLAN: r0=55(x1), r1=146(y1), r2=166(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 146
LDI r2, 166
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
