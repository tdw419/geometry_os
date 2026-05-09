; DESCRIPTION: Composite: Places a blue dot at position (323, 22) then Places a cyan 97x71 rectangle at position (357, 88).
; PLAN: r0=323(x), r1=22(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=357(x), r6=88(y), r7=97(width), r8=71(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 22
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 357
LDI r6, 88
LDI r7, 97
LDI r8, 71
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
