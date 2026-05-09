; DESCRIPTION: Composite: Places a yellow circle of radius 79 at center (83, 98) then Places a green 21x50 rectangle at position (372, 38).
; PLAN: r0=83(x), r1=98(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x), r6=38(y), r7=21(width), r8=50(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 83
LDI r1, 98
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 38
LDI r7, 21
LDI r8, 50
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
