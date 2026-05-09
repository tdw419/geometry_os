; DESCRIPTION: Composite: Draws a black rectangle at (258, 190) with width 55 and height 14 then Places a magenta dot at position (206, 231).
; PLAN: r0=258(x), r1=190(y), r2=55(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x), r6=231(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 258
LDI r1, 190
LDI r2, 55
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 231
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
