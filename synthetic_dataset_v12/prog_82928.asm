; DESCRIPTION: Draws a black line from (294, 196) to (337, 51).
; PLAN: r0=294(x1), r1=196(y1), r2=337(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 196
LDI r2, 337
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
