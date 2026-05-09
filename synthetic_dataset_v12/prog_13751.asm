; DESCRIPTION: Composite: Sets a single blue pixel at (277, 19) then Renders a white line between points (469, 27) and (62, 186).
; PLAN: r0=277(x), r1=19(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=469(x1), r6=27(y1), r7=62(x2), r8=186(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 277
LDI r1, 19
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 469
LDI r6, 27
LDI r7, 62
LDI r8, 186
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
