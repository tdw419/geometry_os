; DESCRIPTION: Composite: Sets a single cyan pixel at (263, 53) then Places a green 18x20 rectangle at position (156, 59).
; PLAN: r0=263(x), r1=53(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=156(x), r6=59(y), r7=18(width), r8=20(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 53
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 156
LDI r6, 59
LDI r7, 18
LDI r8, 20
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
