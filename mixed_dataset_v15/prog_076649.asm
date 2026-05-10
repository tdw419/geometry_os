; DESCRIPTION: Composite: Sets a single red pixel at (117, 116) then Renders a magenta box of size 80x76 starting at (11, 30).
; PLAN: r0=117(x), r1=116(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=11(x), r6=30(y), r7=80(width), r8=76(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 116
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 11
LDI r6, 30
LDI r7, 80
LDI r8, 76
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
