; DESCRIPTION: Composite: Places a green dot at position (32, 160) then Places a purple 98x39 rectangle at position (241, 139).
; PLAN: r0=32(x), r1=160(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=139(y), r7=98(width), r8=39(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 32
LDI r1, 160
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 241
LDI r6, 139
LDI r7, 98
LDI r8, 39
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
