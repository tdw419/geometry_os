; DESCRIPTION: Composite: Renders a purple box of size 103x62 starting at (376, 85) then Sets a single red pixel at (256, 207).
; PLAN: r0=376(x), r1=85(y), r2=103(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=256(x), r6=207(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 376
LDI r1, 85
LDI r2, 103
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 207
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
