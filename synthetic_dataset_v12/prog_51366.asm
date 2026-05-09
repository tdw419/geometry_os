; DESCRIPTION: Composite: Places a magenta dot at position (352, 53) then Creates a orange rectangular region at (11, 82) spanning 20 by 100 pixels then Renders a red disk with center (25, 116) and radius 13.
; PLAN: r0=352(x), r1=53(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=11(x), r6=82(y), r7=20(width), r8=100(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=25(x), r11=116(y), r12=13(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 352
LDI r1, 53
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 11
LDI r6, 82
LDI r7, 20
LDI r8, 100
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 25
LDI r11, 116
LDI r12, 13
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
