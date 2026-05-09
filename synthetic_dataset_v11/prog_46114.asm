; DESCRIPTION: Draws a black line from (150, 98) to (74, 209).
; PLAN: r0=150(x1), r1=98(y1), r2=74(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 98
LDI r2, 74
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
