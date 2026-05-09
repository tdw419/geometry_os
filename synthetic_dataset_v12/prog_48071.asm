; DESCRIPTION: Composite: Places a cyan dot at position (202, 235) then Places a magenta 88x105 rectangle at position (172, 86).
; PLAN: r0=202(x), r1=235(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=172(x), r6=86(y), r7=88(width), r8=105(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 235
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 172
LDI r6, 86
LDI r7, 88
LDI r8, 105
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
