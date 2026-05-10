; DESCRIPTION: Composite: Places a orange dot at position (360, 169) then Places a yellow 16x120 rectangle at position (5, 75).
; PLAN: r0=360(x), r1=169(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=5(x), r6=75(y), r7=16(width), r8=120(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 169
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 5
LDI r6, 75
LDI r7, 16
LDI r8, 120
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
