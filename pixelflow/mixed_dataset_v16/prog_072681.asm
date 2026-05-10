; DESCRIPTION: Composite: Sets a single black pixel at (264, 230) then Places a magenta line segment connecting (59, 253) to (275, 7).
; PLAN: r0=264(x), r1=230(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=59(x1), r6=253(y1), r7=275(x2), r8=7(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 230
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 59
LDI r6, 253
LDI r7, 275
LDI r8, 7
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
