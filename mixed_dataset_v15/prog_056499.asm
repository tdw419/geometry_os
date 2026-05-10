; DESCRIPTION: Composite: Places a magenta dot at position (179, 93) then Draws a yellow circle centered at (401, 140) with radius 54.
; PLAN: r0=179(x), r1=93(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=401(x), r6=140(y), r7=54(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 179
LDI r1, 93
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 401
LDI r6, 140
LDI r7, 54
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
