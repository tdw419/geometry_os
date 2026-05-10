; DESCRIPTION: Composite: Sets a single magenta pixel at (202, 19) then Renders a yellow box of size 105x48 starting at (91, 53).
; PLAN: r0=202(x), r1=19(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=91(x), r6=53(y), r7=105(width), r8=48(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 19
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 91
LDI r6, 53
LDI r7, 105
LDI r8, 48
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
