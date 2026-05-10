; DESCRIPTION: Composite: Places a magenta dot at position (345, 163) then Places a blue 22x28 rectangle at position (241, 160).
; PLAN: r0=345(x), r1=163(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=160(y), r7=22(width), r8=28(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 163
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 241
LDI r6, 160
LDI r7, 22
LDI r8, 28
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
