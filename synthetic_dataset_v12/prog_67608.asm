; DESCRIPTION: Composite: Sets a single magenta pixel at (40, 199) then Draws a cyan line from (375, 42) to (345, 249).
; PLAN: r0=40(x), r1=199(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=375(x1), r6=42(y1), r7=345(x2), r8=249(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 40
LDI r1, 199
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 375
LDI r6, 42
LDI r7, 345
LDI r8, 249
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
