; DESCRIPTION: Draws a black line from (346, 7) to (85, 107).
; PLAN: r0=346(x1), r1=7(y1), r2=85(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 7
LDI r2, 85
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
