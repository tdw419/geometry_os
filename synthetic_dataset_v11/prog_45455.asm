; DESCRIPTION: Draws a black line from (207, 242) to (74, 118).
; PLAN: r0=207(x1), r1=242(y1), r2=74(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 242
LDI r2, 74
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
