; DESCRIPTION: Draws a white line from (493, 14) to (263, 65).
; PLAN: r0=493(x1), r1=14(y1), r2=263(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 14
LDI r2, 263
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
