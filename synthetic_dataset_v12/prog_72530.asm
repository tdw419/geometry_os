; DESCRIPTION: Composite: Sets a single cyan pixel at (183, 249) then Draws a green rectangle at (54, 59) with width 60 and height 120.
; PLAN: r0=183(x), r1=249(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=54(x), r6=59(y), r7=60(width), r8=120(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 183
LDI r1, 249
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 54
LDI r6, 59
LDI r7, 60
LDI r8, 120
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
