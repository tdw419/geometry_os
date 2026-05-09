; DESCRIPTION: Draws a purple line from (107, 242) to (294, 141).
; PLAN: r0=107(x1), r1=242(y1), r2=294(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 242
LDI r2, 294
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
