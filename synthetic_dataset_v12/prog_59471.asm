; DESCRIPTION: Composite: Sets a single magenta pixel at (220, 246) then Creates a white rectangular region at (180, 106) spanning 90 by 120 pixels.
; PLAN: r0=220(x), r1=246(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=180(x), r6=106(y), r7=90(width), r8=120(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 220
LDI r1, 246
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 180
LDI r6, 106
LDI r7, 90
LDI r8, 120
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
