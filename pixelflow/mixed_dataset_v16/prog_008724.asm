; DESCRIPTION: Composite: Places a orange dot at position (400, 7) then Places a magenta 18x90 rectangle at position (281, 68).
; PLAN: r0=400(x), r1=7(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=281(x), r6=68(y), r7=18(width), r8=90(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 7
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 281
LDI r6, 68
LDI r7, 18
LDI r8, 90
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
