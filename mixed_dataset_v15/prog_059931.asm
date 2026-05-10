; DESCRIPTION: Composite: Sets a single orange pixel at (63, 205) then Places a purple 19x64 rectangle at position (488, 132).
; PLAN: r0=63(x), r1=205(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=488(x), r6=132(y), r7=19(width), r8=64(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 63
LDI r1, 205
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 488
LDI r6, 132
LDI r7, 19
LDI r8, 64
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
