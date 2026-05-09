; DESCRIPTION: Composite: Places a red dot at position (374, 192) then Places a cyan 17x47 rectangle at position (2, 37).
; PLAN: r0=374(x), r1=192(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=2(x), r6=37(y), r7=17(width), r8=47(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 192
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 2
LDI r6, 37
LDI r7, 17
LDI r8, 47
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
