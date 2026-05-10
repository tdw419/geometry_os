; DESCRIPTION: Composite: Places a yellow 96x16 rectangle at position (205, 213) then Places a purple dot at position (190, 158).
; PLAN: r0=205(x), r1=213(y), r2=96(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x), r6=158(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 205
LDI r1, 213
LDI r2, 96
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 158
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
