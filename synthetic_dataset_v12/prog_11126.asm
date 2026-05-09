; DESCRIPTION: Composite: Sets a single yellow pixel at (259, 153) then Places a orange 60x87 rectangle at position (412, 48).
; PLAN: r0=259(x), r1=153(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=412(x), r6=48(y), r7=60(width), r8=87(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 259
LDI r1, 153
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 412
LDI r6, 48
LDI r7, 60
LDI r8, 87
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
