; DESCRIPTION: Composite: Places a cyan circle of radius 15 at center (196, 237) then Places a white 42x37 rectangle at position (360, 111).
; PLAN: r0=196(x), r1=237(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x), r6=111(y), r7=42(width), r8=37(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 196
LDI r1, 237
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 111
LDI r7, 42
LDI r8, 37
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
