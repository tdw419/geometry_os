; DESCRIPTION: Composite: Sets a single magenta pixel at (465, 247) then Places a purple line segment connecting (206, 219) to (178, 21).
; PLAN: r0=465(x), r1=247(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=206(x1), r6=219(y1), r7=178(x2), r8=21(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 465
LDI r1, 247
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 206
LDI r6, 219
LDI r7, 178
LDI r8, 21
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
