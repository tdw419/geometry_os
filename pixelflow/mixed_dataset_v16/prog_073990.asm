; DESCRIPTION: Composite: Sets a single blue pixel at (510, 42) then Draws a magenta line from (352, 134) to (173, 134).
; PLAN: r0=510(x), r1=42(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=352(x1), r6=134(y1), r7=173(x2), r8=134(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 510
LDI r1, 42
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 352
LDI r6, 134
LDI r7, 173
LDI r8, 134
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
