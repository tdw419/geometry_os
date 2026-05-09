; DESCRIPTION: Composite: Sets a single orange pixel at (337, 213) then Draws a magenta line from (255, 116) to (17, 4).
; PLAN: r0=337(x), r1=213(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=255(x1), r6=116(y1), r7=17(x2), r8=4(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 213
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 255
LDI r6, 116
LDI r7, 17
LDI r8, 4
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
