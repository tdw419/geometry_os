; DESCRIPTION: Composite: Sets a single cyan pixel at (22, 243) then Draws a black rectangle at (372, 90) with width 112 and height 28.
; PLAN: r0=22(x), r1=243(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=372(x), r6=90(y), r7=112(width), r8=28(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 22
LDI r1, 243
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 372
LDI r6, 90
LDI r7, 112
LDI r8, 28
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
