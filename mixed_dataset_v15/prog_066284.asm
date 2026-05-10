; DESCRIPTION: Composite: Renders a cyan line between points (323, 203) and (434, 32) then Sets a single magenta pixel at (29, 21).
; PLAN: r0=323(x1), r1=203(y1), r2=434(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=29(x), r6=21(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 323
LDI r1, 203
LDI r2, 434
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 21
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
