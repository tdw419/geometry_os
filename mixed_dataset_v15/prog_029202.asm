; DESCRIPTION: Composite: Places a blue dot at position (44, 250) then Renders a orange line between points (482, 159) and (197, 101).
; PLAN: r0=44(x), r1=250(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=482(x1), r6=159(y1), r7=197(x2), r8=101(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 44
LDI r1, 250
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 482
LDI r6, 159
LDI r7, 197
LDI r8, 101
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
