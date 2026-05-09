; DESCRIPTION: Composite: Places a yellow dot at position (319, 207) then Places a red 107x12 rectangle at position (128, 221).
; PLAN: r0=319(x), r1=207(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=128(x), r6=221(y), r7=107(width), r8=12(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 319
LDI r1, 207
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 128
LDI r6, 221
LDI r7, 107
LDI r8, 12
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
