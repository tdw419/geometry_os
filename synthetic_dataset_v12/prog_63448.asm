; DESCRIPTION: Composite: Sets a single orange pixel at (456, 32) then Places a purple 87x99 rectangle at position (400, 110).
; PLAN: r0=456(x), r1=32(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=400(x), r6=110(y), r7=87(width), r8=99(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 456
LDI r1, 32
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 400
LDI r6, 110
LDI r7, 87
LDI r8, 99
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
