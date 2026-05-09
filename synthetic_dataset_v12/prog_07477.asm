; DESCRIPTION: Composite: Sets a single purple pixel at (453, 222) then Places a blue 91x74 rectangle at position (148, 87).
; PLAN: r0=453(x), r1=222(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=148(x), r6=87(y), r7=91(width), r8=74(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 453
LDI r1, 222
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 148
LDI r6, 87
LDI r7, 91
LDI r8, 74
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
