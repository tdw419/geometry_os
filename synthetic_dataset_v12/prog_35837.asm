; DESCRIPTION: Composite: Sets a single black pixel at (162, 159) then Draws a green line from (291, 108) to (382, 228).
; PLAN: r0=162(x), r1=159(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=291(x1), r6=108(y1), r7=382(x2), r8=228(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 162
LDI r1, 159
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 291
LDI r6, 108
LDI r7, 382
LDI r8, 228
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
