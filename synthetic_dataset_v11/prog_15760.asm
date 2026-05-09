; DESCRIPTION: Draws a white line from (198, 30) to (128, 167).
; PLAN: r0=198(x1), r1=30(y1), r2=128(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 30
LDI r2, 128
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
