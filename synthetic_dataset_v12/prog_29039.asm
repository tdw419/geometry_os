; DESCRIPTION: Composite: Sets a single orange pixel at (211, 24) then Places a black 95x59 rectangle at position (99, 154).
; PLAN: r0=211(x), r1=24(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=99(x), r6=154(y), r7=95(width), r8=59(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 24
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 99
LDI r6, 154
LDI r7, 95
LDI r8, 59
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
