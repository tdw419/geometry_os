; DESCRIPTION: Composite: Places a white dot at position (5, 50) then Creates a magenta rectangular region at (281, 209) spanning 100 by 17 pixels.
; PLAN: r0=5(x), r1=50(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=281(x), r6=209(y), r7=100(width), r8=17(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 5
LDI r1, 50
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 281
LDI r6, 209
LDI r7, 100
LDI r8, 17
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
