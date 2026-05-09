; DESCRIPTION: Composite: Sets a single magenta pixel at (455, 121) then Renders a green box of size 11x33 starting at (162, 31).
; PLAN: r0=455(x), r1=121(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=162(x), r6=31(y), r7=11(width), r8=33(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 121
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 162
LDI r6, 31
LDI r7, 11
LDI r8, 33
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
