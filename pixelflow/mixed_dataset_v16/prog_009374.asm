; DESCRIPTION: Composite: Places a orange dot at position (312, 138) then Renders a purple box of size 23x109 starting at (335, 1).
; PLAN: r0=312(x), r1=138(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=335(x), r6=1(y), r7=23(width), r8=109(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 312
LDI r1, 138
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 335
LDI r6, 1
LDI r7, 23
LDI r8, 109
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
