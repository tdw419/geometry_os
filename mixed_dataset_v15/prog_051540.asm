; DESCRIPTION: Composite: Sets a single cyan pixel at (355, 237) then Places a purple 25x120 rectangle at position (76, 86).
; PLAN: r0=355(x), r1=237(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=76(x), r6=86(y), r7=25(width), r8=120(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 355
LDI r1, 237
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 76
LDI r6, 86
LDI r7, 25
LDI r8, 120
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
