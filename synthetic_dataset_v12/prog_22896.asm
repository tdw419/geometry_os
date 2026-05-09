; DESCRIPTION: Composite: Places a black dot at position (233, 114) then Places a yellow line segment connecting (473, 146) to (217, 60).
; PLAN: r0=233(x), r1=114(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=473(x1), r6=146(y1), r7=217(x2), r8=60(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 233
LDI r1, 114
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 473
LDI r6, 146
LDI r7, 217
LDI r8, 60
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
