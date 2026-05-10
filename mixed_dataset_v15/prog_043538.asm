; DESCRIPTION: Draws a white line from (411, 209) to (278, 67).
; PLAN: r0=411(x1), r1=209(y1), r2=278(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 209
LDI r2, 278
LDI r3, 67
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
