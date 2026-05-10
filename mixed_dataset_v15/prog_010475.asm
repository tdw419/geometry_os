; DESCRIPTION: Composite: Places a black line segment connecting (163, 174) to (445, 91) then Places a white dot at position (72, 203).
; PLAN: r0=163(x1), r1=174(y1), r2=445(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=203(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 163
LDI r1, 174
LDI r2, 445
LDI r3, 91
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 203
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
