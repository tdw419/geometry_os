; DESCRIPTION: Draws a white line from (239, 200) to (428, 46).
; PLAN: r0=239(x1), r1=200(y1), r2=428(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 200
LDI r2, 428
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
