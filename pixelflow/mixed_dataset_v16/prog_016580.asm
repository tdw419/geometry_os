; DESCRIPTION: Composite: Sets a single orange pixel at (435, 195) then Draws a white line from (429, 243) to (135, 8).
; PLAN: r0=435(x), r1=195(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=429(x1), r6=243(y1), r7=135(x2), r8=8(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 435
LDI r1, 195
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 429
LDI r6, 243
LDI r7, 135
LDI r8, 8
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
