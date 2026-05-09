; DESCRIPTION: Composite: Places a green 92x10 rectangle at position (63, 11) then Places a green dot at position (467, 149).
; PLAN: r0=63(x), r1=11(y), r2=92(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=467(x), r6=149(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 63
LDI r1, 11
LDI r2, 92
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 149
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
