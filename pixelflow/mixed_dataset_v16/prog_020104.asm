; DESCRIPTION: Composite: Places a cyan dot at position (468, 182) then Draws a orange line from (488, 130) to (187, 187).
; PLAN: r0=468(x), r1=182(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=488(x1), r6=130(y1), r7=187(x2), r8=187(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 468
LDI r1, 182
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 488
LDI r6, 130
LDI r7, 187
LDI r8, 187
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
