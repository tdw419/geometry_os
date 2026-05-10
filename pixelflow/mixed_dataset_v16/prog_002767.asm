; DESCRIPTION: Composite: Sets a single red pixel at (242, 226) then Places a orange 116x42 rectangle at position (311, 200).
; PLAN: r0=242(x), r1=226(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=311(x), r6=200(y), r7=116(width), r8=42(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 226
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 311
LDI r6, 200
LDI r7, 116
LDI r8, 42
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
