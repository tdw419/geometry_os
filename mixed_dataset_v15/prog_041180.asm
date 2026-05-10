; DESCRIPTION: Draws a black line from (80, 213) to (98, 213).
; PLAN: r0=80(x1), r1=213(y1), r2=98(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 213
LDI r2, 98
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
