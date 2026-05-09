; DESCRIPTION: Composite: Places a green 72x58 rectangle at position (90, 16) then Sets a single orange pixel at (11, 22).
; PLAN: r0=90(x), r1=16(y), r2=72(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=11(x), r6=22(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 90
LDI r1, 16
LDI r2, 72
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 22
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
