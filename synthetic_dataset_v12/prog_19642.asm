; DESCRIPTION: Composite: Sets a single red pixel at (23, 210) then Renders a yellow box of size 63x73 starting at (78, 163).
; PLAN: r0=23(x), r1=210(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=78(x), r6=163(y), r7=63(width), r8=73(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 23
LDI r1, 210
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 78
LDI r6, 163
LDI r7, 63
LDI r8, 73
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
