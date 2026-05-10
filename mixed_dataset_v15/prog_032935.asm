; DESCRIPTION: Composite: Places a green dot at position (497, 202) then Places a red 52x13 rectangle at position (213, 114).
; PLAN: r0=497(x), r1=202(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=213(x), r6=114(y), r7=52(width), r8=13(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 497
LDI r1, 202
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 213
LDI r6, 114
LDI r7, 52
LDI r8, 13
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
