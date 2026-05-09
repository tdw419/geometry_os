; DESCRIPTION: Draws a green line from (51, 242) to (243, 206).
; PLAN: r0=51(x1), r1=242(y1), r2=243(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 242
LDI r2, 243
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
