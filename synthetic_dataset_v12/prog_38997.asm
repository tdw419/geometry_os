; DESCRIPTION: Composite: Places a red dot at position (472, 15) then Places a blue 34x26 rectangle at position (417, 220).
; PLAN: r0=472(x), r1=15(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=417(x), r6=220(y), r7=34(width), r8=26(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 472
LDI r1, 15
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 417
LDI r6, 220
LDI r7, 34
LDI r8, 26
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
