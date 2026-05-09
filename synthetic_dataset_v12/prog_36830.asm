; DESCRIPTION: Draws a white line from (395, 152) to (254, 239).
; PLAN: r0=395(x1), r1=152(y1), r2=254(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 152
LDI r2, 254
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
