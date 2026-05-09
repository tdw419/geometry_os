; DESCRIPTION: Composite: Places a orange dot at position (340, 81) then Places a red 111x115 rectangle at position (50, 55).
; PLAN: r0=340(x), r1=81(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=50(x), r6=55(y), r7=111(width), r8=115(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 340
LDI r1, 81
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 50
LDI r6, 55
LDI r7, 111
LDI r8, 115
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
