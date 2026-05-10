; DESCRIPTION: Composite: Sets a single white pixel at (71, 152) then Draws a magenta line from (281, 199) to (127, 6).
; PLAN: r0=71(x), r1=152(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=281(x1), r6=199(y1), r7=127(x2), r8=6(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 71
LDI r1, 152
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 281
LDI r6, 199
LDI r7, 127
LDI r8, 6
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
