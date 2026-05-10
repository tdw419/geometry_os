; DESCRIPTION: Composite: Sets a single green pixel at (116, 209) then Renders a black line between points (105, 239) and (177, 108).
; PLAN: r0=116(x), r1=209(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=105(x1), r6=239(y1), r7=177(x2), r8=108(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 209
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 105
LDI r6, 239
LDI r7, 177
LDI r8, 108
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
