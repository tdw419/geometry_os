; DESCRIPTION: Composite: Creates a orange rectangular region at (132, 13) spanning 24 by 63 pixels then Places a purple dot at position (238, 16).
; PLAN: r0=132(x), r1=13(y), r2=24(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x), r6=16(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 132
LDI r1, 13
LDI r2, 24
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 16
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
