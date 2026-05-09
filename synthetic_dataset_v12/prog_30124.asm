; DESCRIPTION: Draws a white line from (492, 198) to (209, 40).
; PLAN: r0=492(x1), r1=198(y1), r2=209(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 198
LDI r2, 209
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
