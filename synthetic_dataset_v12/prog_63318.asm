; DESCRIPTION: Composite: Places a magenta 17x13 rectangle at position (351, 230) then Places a green dot at position (345, 220).
; PLAN: r0=351(x), r1=230(y), r2=17(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x), r6=220(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 351
LDI r1, 230
LDI r2, 17
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 220
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
