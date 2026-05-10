; DESCRIPTION: Composite: Renders a white line between points (22, 117) and (344, 6) then Places a magenta dot at position (303, 217).
; PLAN: r0=22(x1), r1=117(y1), r2=344(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=217(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 22
LDI r1, 117
LDI r2, 344
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 217
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
