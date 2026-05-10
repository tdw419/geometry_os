; DESCRIPTION: Composite: Places a cyan dot at position (56, 99) then Draws a green rectangle at (353, 46) with width 45 and height 93.
; PLAN: r0=56(x), r1=99(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=353(x), r6=46(y), r7=45(width), r8=93(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 56
LDI r1, 99
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 353
LDI r6, 46
LDI r7, 45
LDI r8, 93
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
