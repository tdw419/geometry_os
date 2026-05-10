; DESCRIPTION: Composite: Sets a single purple pixel at (146, 80) then Renders a blue box of size 118x26 starting at (329, 24).
; PLAN: r0=146(x), r1=80(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=329(x), r6=24(y), r7=118(width), r8=26(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 80
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 329
LDI r6, 24
LDI r7, 118
LDI r8, 26
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
