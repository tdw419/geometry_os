; DESCRIPTION: Composite: Places a magenta 68x12 rectangle at position (139, 68) then Places a magenta dot at position (214, 231).
; PLAN: r0=139(x), r1=68(y), r2=68(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=214(x), r6=231(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 139
LDI r1, 68
LDI r2, 68
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 231
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
