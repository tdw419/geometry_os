; DESCRIPTION: Draws a cyan line from (185, 211) to (285, 115).
; PLAN: r0=185(x1), r1=211(y1), r2=285(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 211
LDI r2, 285
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
