; DESCRIPTION: Composite: Places a blue dot at position (445, 203) then Renders a red disk with center (183, 110) and radius 68.
; PLAN: r0=445(x), r1=203(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=110(y), r7=68(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 445
LDI r1, 203
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 183
LDI r6, 110
LDI r7, 68
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
