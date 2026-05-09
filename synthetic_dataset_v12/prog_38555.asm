; DESCRIPTION: Composite: Sets a single magenta pixel at (74, 165) then Places a green line segment connecting (68, 249) to (505, 238).
; PLAN: r0=74(x), r1=165(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=68(x1), r6=249(y1), r7=505(x2), r8=238(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 74
LDI r1, 165
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 68
LDI r6, 249
LDI r7, 505
LDI r8, 238
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
