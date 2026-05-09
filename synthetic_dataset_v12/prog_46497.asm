; DESCRIPTION: Composite: Places a orange dot at position (40, 177) then Creates a orange rectangular region at (300, 106) spanning 120 by 18 pixels.
; PLAN: r0=40(x), r1=177(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=106(y), r7=120(width), r8=18(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 40
LDI r1, 177
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 300
LDI r6, 106
LDI r7, 120
LDI r8, 18
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
