; DESCRIPTION: Composite: Sets a single cyan pixel at (295, 5) then Renders a orange line between points (81, 35) and (280, 87).
; PLAN: r0=295(x), r1=5(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=81(x1), r6=35(y1), r7=280(x2), r8=87(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 5
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 81
LDI r6, 35
LDI r7, 280
LDI r8, 87
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
