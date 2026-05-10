; DESCRIPTION: Composite: Places a purple 45x68 rectangle at position (237, 63) then Places a red dot at position (69, 34).
; PLAN: r0=237(x), r1=63(y), r2=45(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x), r6=34(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 237
LDI r1, 63
LDI r2, 45
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 34
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
