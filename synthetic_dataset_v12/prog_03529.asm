; DESCRIPTION: Composite: Renders a cyan line between points (84, 4) and (478, 56) then Places a blue dot at position (499, 235).
; PLAN: r0=84(x1), r1=4(y1), r2=478(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=499(x), r6=235(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 84
LDI r1, 4
LDI r2, 478
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 499
LDI r6, 235
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
