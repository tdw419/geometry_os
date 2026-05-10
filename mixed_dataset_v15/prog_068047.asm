; DESCRIPTION: Composite: Places a red dot at position (182, 222) then Renders a white box of size 38x74 starting at (363, 172).
; PLAN: r0=182(x), r1=222(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=363(x), r6=172(y), r7=38(width), r8=74(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 222
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 363
LDI r6, 172
LDI r7, 38
LDI r8, 74
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
