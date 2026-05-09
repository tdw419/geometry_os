; DESCRIPTION: Composite: Sets a single blue pixel at (509, 127) then Draws a black line from (474, 116) to (203, 114).
; PLAN: r0=509(x), r1=127(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=474(x1), r6=116(y1), r7=203(x2), r8=114(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 509
LDI r1, 127
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 474
LDI r6, 116
LDI r7, 203
LDI r8, 114
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
