; DESCRIPTION: Composite: Sets a single orange pixel at (24, 20) then Renders a blue box of size 106x102 starting at (166, 113).
; PLAN: r0=24(x), r1=20(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=166(x), r6=113(y), r7=106(width), r8=102(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 24
LDI r1, 20
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 166
LDI r6, 113
LDI r7, 106
LDI r8, 102
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
