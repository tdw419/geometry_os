; DESCRIPTION: Composite: Sets a single purple pixel at (422, 135) then Renders a orange box of size 110x118 starting at (138, 138).
; PLAN: r0=422(x), r1=135(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=138(x), r6=138(y), r7=110(width), r8=118(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 135
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 138
LDI r6, 138
LDI r7, 110
LDI r8, 118
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
