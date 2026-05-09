; DESCRIPTION: Composite: Places a orange dot at position (104, 193) then Places a yellow 89x64 rectangle at position (227, 178).
; PLAN: r0=104(x), r1=193(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=227(x), r6=178(y), r7=89(width), r8=64(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 193
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 227
LDI r6, 178
LDI r7, 89
LDI r8, 64
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
