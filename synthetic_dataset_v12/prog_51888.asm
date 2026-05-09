; DESCRIPTION: Composite: Places a purple 116x50 rectangle at position (372, 76) then Sets a single magenta pixel at (392, 19).
; PLAN: r0=372(x), r1=76(y), r2=116(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=392(x), r6=19(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 372
LDI r1, 76
LDI r2, 116
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 19
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
