; DESCRIPTION: Draws a black line from (392, 81) to (187, 167).
; PLAN: r0=392(x1), r1=81(y1), r2=187(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 81
LDI r2, 187
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
