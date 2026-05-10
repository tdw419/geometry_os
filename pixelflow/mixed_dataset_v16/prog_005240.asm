; DESCRIPTION: Composite: Places a magenta dot at position (220, 60) then Renders a red disk with center (121, 119) and radius 57.
; PLAN: r0=220(x), r1=60(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=121(x), r6=119(y), r7=57(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 220
LDI r1, 60
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 121
LDI r6, 119
LDI r7, 57
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
