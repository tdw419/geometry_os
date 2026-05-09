; DESCRIPTION: Composite: Sets a single black pixel at (420, 122) then Places a yellow 13x100 rectangle at position (45, 137).
; PLAN: r0=420(x), r1=122(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=45(x), r6=137(y), r7=13(width), r8=100(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 122
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 45
LDI r6, 137
LDI r7, 13
LDI r8, 100
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
