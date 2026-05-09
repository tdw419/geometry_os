; DESCRIPTION: Composite: Places a green dot at position (473, 118) then Draws a purple line from (277, 165) to (168, 81).
; PLAN: r0=473(x), r1=118(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=277(x1), r6=165(y1), r7=168(x2), r8=81(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 473
LDI r1, 118
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 277
LDI r6, 165
LDI r7, 168
LDI r8, 81
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
