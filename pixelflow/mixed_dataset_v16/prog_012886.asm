; DESCRIPTION: Composite: Sets a single purple pixel at (118, 88) then Renders a yellow box of size 55x82 starting at (160, 130).
; PLAN: r0=118(x), r1=88(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=160(x), r6=130(y), r7=55(width), r8=82(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 118
LDI r1, 88
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 160
LDI r6, 130
LDI r7, 55
LDI r8, 82
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
