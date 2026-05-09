; DESCRIPTION: Composite: Places a orange 57x19 rectangle at position (209, 96) then Sets a single yellow pixel at (221, 10).
; PLAN: r0=209(x), r1=96(y), r2=57(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=221(x), r6=10(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 209
LDI r1, 96
LDI r2, 57
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 10
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
