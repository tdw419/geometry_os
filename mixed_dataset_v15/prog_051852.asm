; DESCRIPTION: Draws a black line from (215, 146) to (101, 66).
; PLAN: r0=215(x1), r1=146(y1), r2=101(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 146
LDI r2, 101
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
