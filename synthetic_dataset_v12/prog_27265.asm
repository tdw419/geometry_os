; DESCRIPTION: Draws a black line from (492, 220) to (98, 27).
; PLAN: r0=492(x1), r1=220(y1), r2=98(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 220
LDI r2, 98
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
