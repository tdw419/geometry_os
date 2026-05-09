; DESCRIPTION: Composite: Places a black dot at position (117, 200) then Renders a cyan box of size 95x37 starting at (115, 14).
; PLAN: r0=117(x), r1=200(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=115(x), r6=14(y), r7=95(width), r8=37(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 200
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 115
LDI r6, 14
LDI r7, 95
LDI r8, 37
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
