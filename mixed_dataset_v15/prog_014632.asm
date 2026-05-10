; DESCRIPTION: Composite: Places a red dot at position (444, 173) then Renders a black line between points (275, 65) and (80, 69).
; PLAN: r0=444(x), r1=173(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=275(x1), r6=65(y1), r7=80(x2), r8=69(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 444
LDI r1, 173
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 275
LDI r6, 65
LDI r7, 80
LDI r8, 69
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
