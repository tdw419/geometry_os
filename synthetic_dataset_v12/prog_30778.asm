; DESCRIPTION: Composite: Places a green dot at position (267, 182) then Places a orange 72x15 rectangle at position (54, 226).
; PLAN: r0=267(x), r1=182(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=54(x), r6=226(y), r7=72(width), r8=15(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 267
LDI r1, 182
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 54
LDI r6, 226
LDI r7, 72
LDI r8, 15
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
