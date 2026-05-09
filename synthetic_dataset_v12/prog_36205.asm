; DESCRIPTION: Composite: Places a cyan circle of radius 33 at center (39, 82) then Places a magenta 58x109 rectangle at position (30, 23).
; PLAN: r0=39(x), r1=82(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x), r6=23(y), r7=58(width), r8=109(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 39
LDI r1, 82
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 23
LDI r7, 58
LDI r8, 109
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
