; DESCRIPTION: Composite: Sets a single purple pixel at (402, 74) then Draws a black line from (410, 76) to (295, 116).
; PLAN: r0=402(x), r1=74(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=410(x1), r6=76(y1), r7=295(x2), r8=116(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 74
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 410
LDI r6, 76
LDI r7, 295
LDI r8, 116
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
