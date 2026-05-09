; DESCRIPTION: Draws a black line from (70, 170) to (48, 195).
; PLAN: r0=70(x1), r1=170(y1), r2=48(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 170
LDI r2, 48
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
