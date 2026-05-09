; DESCRIPTION: Draws a green line from (107, 178) to (242, 65).
; PLAN: r0=107(x1), r1=178(y1), r2=242(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 178
LDI r2, 242
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
