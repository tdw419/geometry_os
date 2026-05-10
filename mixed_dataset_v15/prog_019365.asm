; DESCRIPTION: Composite: Places a magenta dot at position (295, 102) then Renders a magenta line between points (313, 36) and (85, 79).
; PLAN: r0=295(x), r1=102(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=313(x1), r6=36(y1), r7=85(x2), r8=79(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 102
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 313
LDI r6, 36
LDI r7, 85
LDI r8, 79
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
