; DESCRIPTION: Composite: Places a green 116x60 rectangle at position (360, 23) then Sets a single orange pixel at (291, 123).
; PLAN: r0=360(x), r1=23(y), r2=116(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x), r6=123(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 360
LDI r1, 23
LDI r2, 116
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 123
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
