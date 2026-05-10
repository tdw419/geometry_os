; DESCRIPTION: Composite: Renders a magenta line between points (167, 139) and (483, 24) then Places a magenta 107x93 rectangle at position (329, 84).
; PLAN: r0=167(x1), r1=139(y1), r2=483(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=84(y), r7=107(width), r8=93(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 139
LDI r2, 483
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 84
LDI r7, 107
LDI r8, 93
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
