; DESCRIPTION: Draws a white line from (144, 178) to (4, 236).
; PLAN: r0=144(x1), r1=178(y1), r2=4(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 178
LDI r2, 4
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
