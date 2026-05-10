; DESCRIPTION: Composite: Places a green dot at position (222, 85) then Places a purple 66x29 rectangle at position (385, 49).
; PLAN: r0=222(x), r1=85(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=385(x), r6=49(y), r7=66(width), r8=29(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 85
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 385
LDI r6, 49
LDI r7, 66
LDI r8, 29
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
