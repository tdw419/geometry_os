; DESCRIPTION: Draws a white line from (214, 211) to (377, 209).
; PLAN: r0=214(x1), r1=211(y1), r2=377(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 211
LDI r2, 377
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
