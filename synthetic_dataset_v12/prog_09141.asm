; DESCRIPTION: Draws a white line from (416, 167) to (355, 209).
; PLAN: r0=416(x1), r1=167(y1), r2=355(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 167
LDI r2, 355
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
