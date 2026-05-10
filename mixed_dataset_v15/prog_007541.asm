; DESCRIPTION: Composite: Places a blue dot at position (35, 7) then Draws a purple line from (79, 67) to (484, 224).
; PLAN: r0=35(x), r1=7(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=79(x1), r6=67(y1), r7=484(x2), r8=224(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 35
LDI r1, 7
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 79
LDI r6, 67
LDI r7, 484
LDI r8, 224
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
