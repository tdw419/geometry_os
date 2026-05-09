; DESCRIPTION: Composite: Places a blue dot at position (419, 179) then Places a purple 13x62 rectangle at position (405, 39).
; PLAN: r0=419(x), r1=179(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=405(x), r6=39(y), r7=13(width), r8=62(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 179
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 405
LDI r6, 39
LDI r7, 13
LDI r8, 62
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
