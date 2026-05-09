; DESCRIPTION: Composite: Places a orange dot at position (169, 90) then Places a red 95x91 rectangle at position (145, 9).
; PLAN: r0=169(x), r1=90(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=145(x), r6=9(y), r7=95(width), r8=91(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 169
LDI r1, 90
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 145
LDI r6, 9
LDI r7, 95
LDI r8, 91
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
