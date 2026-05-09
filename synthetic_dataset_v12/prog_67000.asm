; DESCRIPTION: Composite: Sets a single red pixel at (495, 182) then Renders a cyan box of size 44x67 starting at (340, 91).
; PLAN: r0=495(x), r1=182(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=340(x), r6=91(y), r7=44(width), r8=67(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 495
LDI r1, 182
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 340
LDI r6, 91
LDI r7, 44
LDI r8, 67
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
