; DESCRIPTION: Composite: Places a blue dot at position (218, 247) then Places a red line segment connecting (358, 229) to (367, 208).
; PLAN: r0=218(x), r1=247(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=358(x1), r6=229(y1), r7=367(x2), r8=208(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 247
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 358
LDI r6, 229
LDI r7, 367
LDI r8, 208
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
