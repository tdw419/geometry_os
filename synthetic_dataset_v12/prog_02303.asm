; DESCRIPTION: Composite: Draws a yellow line from (374, 24) to (220, 242) then Places a white dot at position (453, 84).
; PLAN: r0=374(x1), r1=24(y1), r2=220(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=453(x), r6=84(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 374
LDI r1, 24
LDI r2, 220
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 84
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
