; DESCRIPTION: Composite: Places a red dot at position (353, 238) then Draws a cyan rectangle at (109, 74) with width 112 and height 65.
; PLAN: r0=353(x), r1=238(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=109(x), r6=74(y), r7=112(width), r8=65(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 353
LDI r1, 238
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 109
LDI r6, 74
LDI r7, 112
LDI r8, 65
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
