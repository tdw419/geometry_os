; DESCRIPTION: Composite: Places a red dot at position (485, 151) then Draws a red line from (474, 2) to (273, 70).
; PLAN: r0=485(x), r1=151(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=474(x1), r6=2(y1), r7=273(x2), r8=70(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 485
LDI r1, 151
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 474
LDI r6, 2
LDI r7, 273
LDI r8, 70
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
