; DESCRIPTION: Composite: Places a magenta dot at position (449, 188) then Renders a white line between points (49, 114) and (20, 32).
; PLAN: r0=449(x), r1=188(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=49(x1), r6=114(y1), r7=20(x2), r8=32(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 449
LDI r1, 188
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 49
LDI r6, 114
LDI r7, 20
LDI r8, 32
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
