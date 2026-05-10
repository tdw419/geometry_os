; DESCRIPTION: Composite: Sets a single black pixel at (464, 1) then Places a green 87x11 rectangle at position (287, 43).
; PLAN: r0=464(x), r1=1(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=287(x), r6=43(y), r7=87(width), r8=11(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 464
LDI r1, 1
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 287
LDI r6, 43
LDI r7, 87
LDI r8, 11
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
