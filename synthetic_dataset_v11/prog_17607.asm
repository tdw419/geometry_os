; DESCRIPTION: Draws a white line from (254, 210) to (240, 214).
; PLAN: r0=254(x1), r1=210(y1), r2=240(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 210
LDI r2, 240
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
