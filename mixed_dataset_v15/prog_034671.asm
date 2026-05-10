; DESCRIPTION: Composite: Sets a single green pixel at (74, 174) then Renders a blue box of size 102x69 starting at (10, 4).
; PLAN: r0=74(x), r1=174(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=10(x), r6=4(y), r7=102(width), r8=69(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 74
LDI r1, 174
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 10
LDI r6, 4
LDI r7, 102
LDI r8, 69
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
