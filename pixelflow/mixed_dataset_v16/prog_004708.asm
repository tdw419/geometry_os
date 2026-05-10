; DESCRIPTION: Composite: Places a magenta dot at position (261, 94) then Creates a magenta circular shape at (162, 168) with radius 70.
; PLAN: r0=261(x), r1=94(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=162(x), r6=168(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 261
LDI r1, 94
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 162
LDI r6, 168
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
