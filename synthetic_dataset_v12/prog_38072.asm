; DESCRIPTION: Composite: Places a cyan 73x14 rectangle at position (167, 44) then Sets a single magenta pixel at (140, 139).
; PLAN: r0=167(x), r1=44(y), r2=73(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=140(x), r6=139(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 167
LDI r1, 44
LDI r2, 73
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 139
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
