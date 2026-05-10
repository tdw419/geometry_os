; DESCRIPTION: Composite: Renders a blue line between points (390, 7) and (135, 203) then Places a cyan dot at position (277, 111).
; PLAN: r0=390(x1), r1=7(y1), r2=135(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=111(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 390
LDI r1, 7
LDI r2, 135
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 111
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
