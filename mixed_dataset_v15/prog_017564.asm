; DESCRIPTION: Composite: Sets a single yellow pixel at (504, 111) then Places a green 21x54 rectangle at position (364, 115).
; PLAN: r0=504(x), r1=111(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=364(x), r6=115(y), r7=21(width), r8=54(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 504
LDI r1, 111
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 364
LDI r6, 115
LDI r7, 21
LDI r8, 54
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
