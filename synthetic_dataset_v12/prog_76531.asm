; DESCRIPTION: Draws a white line from (128, 115) to (77, 64).
; PLAN: r0=128(x1), r1=115(y1), r2=77(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 115
LDI r2, 77
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
