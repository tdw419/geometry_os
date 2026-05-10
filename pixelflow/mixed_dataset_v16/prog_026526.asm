; DESCRIPTION: Composite: Sets a single orange pixel at (129, 253) then Renders a red box of size 27x105 starting at (63, 134).
; PLAN: r0=129(x), r1=253(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=63(x), r6=134(y), r7=27(width), r8=105(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 253
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 63
LDI r6, 134
LDI r7, 27
LDI r8, 105
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
