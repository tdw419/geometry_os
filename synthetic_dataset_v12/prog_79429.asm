; DESCRIPTION: Composite: Places a yellow dot at position (2, 130) then Draws a orange line from (205, 66) to (52, 178).
; PLAN: r0=2(x), r1=130(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=205(x1), r6=66(y1), r7=52(x2), r8=178(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 2
LDI r1, 130
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 205
LDI r6, 66
LDI r7, 52
LDI r8, 178
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
