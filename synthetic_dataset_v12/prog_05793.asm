; DESCRIPTION: Draws a white line from (8, 95) to (417, 40).
; PLAN: r0=8(x1), r1=95(y1), r2=417(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 95
LDI r2, 417
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
