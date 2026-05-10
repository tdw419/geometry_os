; DESCRIPTION: Composite: Sets a single yellow pixel at (460, 112) then Draws a orange line from (108, 242) to (269, 91).
; PLAN: r0=460(x), r1=112(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=108(x1), r6=242(y1), r7=269(x2), r8=91(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 460
LDI r1, 112
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 108
LDI r6, 242
LDI r7, 269
LDI r8, 91
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
