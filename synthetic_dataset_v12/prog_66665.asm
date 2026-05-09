; DESCRIPTION: Draws a white line from (48, 14) to (417, 219).
; PLAN: r0=48(x1), r1=14(y1), r2=417(x2), r3=219(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 14
LDI r2, 417
LDI r3, 219
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
