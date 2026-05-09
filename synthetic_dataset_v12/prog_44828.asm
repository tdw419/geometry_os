; DESCRIPTION: Composite: Sets a single orange pixel at (329, 168) then Draws a magenta line from (274, 42) to (254, 251).
; PLAN: r0=329(x), r1=168(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=274(x1), r6=42(y1), r7=254(x2), r8=251(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 329
LDI r1, 168
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 274
LDI r6, 42
LDI r7, 254
LDI r8, 251
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
