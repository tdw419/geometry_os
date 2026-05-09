; DESCRIPTION: Composite: Sets a single cyan pixel at (420, 119) then Renders a black box of size 74x22 starting at (169, 196).
; PLAN: r0=420(x), r1=119(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=169(x), r6=196(y), r7=74(width), r8=22(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 119
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 169
LDI r6, 196
LDI r7, 74
LDI r8, 22
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
