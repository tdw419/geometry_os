; DESCRIPTION: Composite: Places a green dot at position (226, 217) then Places a purple 86x32 rectangle at position (216, 183).
; PLAN: r0=226(x), r1=217(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=216(x), r6=183(y), r7=86(width), r8=32(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 217
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 216
LDI r6, 183
LDI r7, 86
LDI r8, 32
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
