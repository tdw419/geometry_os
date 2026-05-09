; DESCRIPTION: Composite: Places a white dot at position (316, 184) then Draws a blue line from (253, 205) to (91, 120).
; PLAN: r0=316(x), r1=184(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=253(x1), r6=205(y1), r7=91(x2), r8=120(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 316
LDI r1, 184
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 253
LDI r6, 205
LDI r7, 91
LDI r8, 120
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
