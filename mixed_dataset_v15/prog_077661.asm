; DESCRIPTION: Composite: Places a black dot at position (207, 137) then Places a cyan 19x32 rectangle at position (300, 1).
; PLAN: r0=207(x), r1=137(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=1(y), r7=19(width), r8=32(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 207
LDI r1, 137
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 300
LDI r6, 1
LDI r7, 19
LDI r8, 32
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
