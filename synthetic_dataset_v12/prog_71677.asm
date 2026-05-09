; DESCRIPTION: Composite: Places a yellow dot at position (26, 163) then Renders a red box of size 75x94 starting at (165, 161).
; PLAN: r0=26(x), r1=163(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=161(y), r7=75(width), r8=94(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 26
LDI r1, 163
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 165
LDI r6, 161
LDI r7, 75
LDI r8, 94
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
