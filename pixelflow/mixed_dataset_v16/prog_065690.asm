; DESCRIPTION: Composite: Places a cyan dot at position (499, 190) then Places a black 91x115 rectangle at position (174, 117).
; PLAN: r0=499(x), r1=190(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=174(x), r6=117(y), r7=91(width), r8=115(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 499
LDI r1, 190
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 174
LDI r6, 117
LDI r7, 91
LDI r8, 115
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
