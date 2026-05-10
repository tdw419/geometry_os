; DESCRIPTION: Composite: Places a white dot at position (359, 127) then Places a magenta 106x85 rectangle at position (290, 143).
; PLAN: r0=359(x), r1=127(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=290(x), r6=143(y), r7=106(width), r8=85(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 127
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 290
LDI r6, 143
LDI r7, 106
LDI r8, 85
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
