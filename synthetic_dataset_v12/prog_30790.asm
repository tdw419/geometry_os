; DESCRIPTION: Composite: Places a purple dot at position (464, 146) then Places a black line segment connecting (271, 106) to (35, 203).
; PLAN: r0=464(x), r1=146(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=271(x1), r6=106(y1), r7=35(x2), r8=203(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 464
LDI r1, 146
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 271
LDI r6, 106
LDI r7, 35
LDI r8, 203
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
