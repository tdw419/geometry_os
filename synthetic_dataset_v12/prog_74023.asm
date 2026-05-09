; DESCRIPTION: Composite: Sets a single orange pixel at (108, 35) then Places a green 113x35 rectangle at position (212, 137).
; PLAN: r0=108(x), r1=35(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=212(x), r6=137(y), r7=113(width), r8=35(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 108
LDI r1, 35
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 212
LDI r6, 137
LDI r7, 113
LDI r8, 35
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
