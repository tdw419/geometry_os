; DESCRIPTION: Composite: Places a blue dot at position (428, 186) then Places a red line segment connecting (6, 33) to (275, 132).
; PLAN: r0=428(x), r1=186(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=6(x1), r6=33(y1), r7=275(x2), r8=132(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 428
LDI r1, 186
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 6
LDI r6, 33
LDI r7, 275
LDI r8, 132
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
