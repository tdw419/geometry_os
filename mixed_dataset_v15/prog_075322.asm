; DESCRIPTION: Composite: Places a yellow line segment connecting (362, 37) to (416, 28) then Places a blue dot at position (179, 59).
; PLAN: r0=362(x1), r1=37(y1), r2=416(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=179(x), r6=59(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 362
LDI r1, 37
LDI r2, 416
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 59
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
