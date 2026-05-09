; DESCRIPTION: Draws a white line from (311, 47) to (509, 209).
; PLAN: r0=311(x1), r1=47(y1), r2=509(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 47
LDI r2, 509
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
