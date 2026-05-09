; DESCRIPTION: Composite: Sets a single blue pixel at (67, 218) then Places a yellow 60x53 rectangle at position (18, 59).
; PLAN: r0=67(x), r1=218(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=18(x), r6=59(y), r7=60(width), r8=53(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 218
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 18
LDI r6, 59
LDI r7, 60
LDI r8, 53
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
