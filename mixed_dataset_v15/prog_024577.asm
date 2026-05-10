; DESCRIPTION: Composite: Places a cyan 86x90 rectangle at position (100, 67) then Sets a single red pixel at (486, 40).
; PLAN: r0=100(x), r1=67(y), r2=86(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=486(x), r6=40(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 100
LDI r1, 67
LDI r2, 86
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 40
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
