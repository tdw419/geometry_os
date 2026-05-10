; DESCRIPTION: Composite: Places a black dot at position (375, 186) then Renders a black box of size 33x103 starting at (380, 27).
; PLAN: r0=375(x), r1=186(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=380(x), r6=27(y), r7=33(width), r8=103(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 186
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 380
LDI r6, 27
LDI r7, 33
LDI r8, 103
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
