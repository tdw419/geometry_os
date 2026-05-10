; DESCRIPTION: Draws a green line from (380, 176) to (279, 5).
; PLAN: r0=380(x1), r1=176(y1), r2=279(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 176
LDI r2, 279
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
