; DESCRIPTION: Draws a white line from (440, 251) to (291, 152).
; PLAN: r0=440(x1), r1=251(y1), r2=291(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 251
LDI r2, 291
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
