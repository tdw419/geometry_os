; DESCRIPTION: Composite: Sets a single cyan pixel at (229, 109) then Places a green 55x18 rectangle at position (456, 112).
; PLAN: r0=229(x), r1=109(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=456(x), r6=112(y), r7=55(width), r8=18(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 109
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 456
LDI r6, 112
LDI r7, 55
LDI r8, 18
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
