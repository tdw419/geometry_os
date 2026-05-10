; DESCRIPTION: Draws a white line from (254, 70) to (298, 193).
; PLAN: r0=254(x1), r1=70(y1), r2=298(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 70
LDI r2, 298
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
