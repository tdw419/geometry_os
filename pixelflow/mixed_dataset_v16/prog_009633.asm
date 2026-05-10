; DESCRIPTION: Composite: Places a purple dot at position (455, 133) then Renders a cyan box of size 62x107 starting at (371, 94).
; PLAN: r0=455(x), r1=133(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=371(x), r6=94(y), r7=62(width), r8=107(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 133
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 371
LDI r6, 94
LDI r7, 62
LDI r8, 107
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
