; DESCRIPTION: Composite: Renders a red line between points (345, 228) and (267, 16) then Sets a single magenta pixel at (12, 154).
; PLAN: r0=345(x1), r1=228(y1), r2=267(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=12(x), r6=154(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 345
LDI r1, 228
LDI r2, 267
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 154
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
