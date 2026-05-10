; DESCRIPTION: Composite: Places a cyan dot at position (469, 217) then Renders a cyan box of size 12x120 starting at (166, 22).
; PLAN: r0=469(x), r1=217(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=166(x), r6=22(y), r7=12(width), r8=120(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 469
LDI r1, 217
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 166
LDI r6, 22
LDI r7, 12
LDI r8, 120
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
