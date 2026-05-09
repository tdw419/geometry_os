; DESCRIPTION: Composite: Sets a single cyan pixel at (218, 188) then Draws a red rectangle at (140, 92) with width 60 and height 95.
; PLAN: r0=218(x), r1=188(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=92(y), r7=60(width), r8=95(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 188
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 140
LDI r6, 92
LDI r7, 60
LDI r8, 95
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
