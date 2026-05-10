; DESCRIPTION: Composite: Sets a single red pixel at (183, 154) then Places a cyan 74x95 rectangle at position (328, 58).
; PLAN: r0=183(x), r1=154(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=328(x), r6=58(y), r7=74(width), r8=95(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 183
LDI r1, 154
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 328
LDI r6, 58
LDI r7, 74
LDI r8, 95
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
