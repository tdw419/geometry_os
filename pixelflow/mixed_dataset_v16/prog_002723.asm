; DESCRIPTION: Composite: Places a magenta dot at position (397, 93) then Places a yellow line segment connecting (186, 179) to (64, 131).
; PLAN: r0=397(x), r1=93(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=186(x1), r6=179(y1), r7=64(x2), r8=131(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 397
LDI r1, 93
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 186
LDI r6, 179
LDI r7, 64
LDI r8, 131
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
