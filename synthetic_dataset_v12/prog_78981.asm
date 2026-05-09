; DESCRIPTION: Draws a black line from (178, 242) to (419, 216).
; PLAN: r0=178(x1), r1=242(y1), r2=419(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 242
LDI r2, 419
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
