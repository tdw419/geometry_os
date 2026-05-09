; DESCRIPTION: Composite: Places a magenta dot at position (221, 102) then Creates a red rectangular region at (365, 145) spanning 100 by 74 pixels.
; PLAN: r0=221(x), r1=102(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=365(x), r6=145(y), r7=100(width), r8=74(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 221
LDI r1, 102
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 365
LDI r6, 145
LDI r7, 100
LDI r8, 74
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
