; DESCRIPTION: Composite: Places a black dot at position (217, 27) then Draws a blue line from (362, 178) to (274, 49).
; PLAN: r0=217(x), r1=27(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=362(x1), r6=178(y1), r7=274(x2), r8=49(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 27
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 362
LDI r6, 178
LDI r7, 274
LDI r8, 49
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
