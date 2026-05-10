; DESCRIPTION: Composite: Places a orange 67x21 rectangle at position (387, 13) then Sets a single yellow pixel at (307, 90).
; PLAN: r0=387(x), r1=13(y), r2=67(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=307(x), r6=90(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 387
LDI r1, 13
LDI r2, 67
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 90
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
