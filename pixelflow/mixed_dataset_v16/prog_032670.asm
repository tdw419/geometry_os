; DESCRIPTION: Draws a white line from (248, 3) to (255, 40).
; PLAN: r0=248(x1), r1=3(y1), r2=255(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 3
LDI r2, 255
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
