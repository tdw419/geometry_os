; DESCRIPTION: Draws a white line from (275, 96) to (476, 186).
; PLAN: r0=275(x1), r1=96(y1), r2=476(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 96
LDI r2, 476
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
