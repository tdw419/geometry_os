; DESCRIPTION: Composite: Sets a single red pixel at (169, 181) then Draws a orange rectangle at (196, 8) with width 30 and height 108.
; PLAN: r0=169(x), r1=181(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=196(x), r6=8(y), r7=30(width), r8=108(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 169
LDI r1, 181
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 196
LDI r6, 8
LDI r7, 30
LDI r8, 108
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
