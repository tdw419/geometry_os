; DESCRIPTION: Composite: Draws a yellow circle centered at (104, 169) with radius 34 then Places a green 87x16 rectangle at position (405, 57).
; PLAN: r0=104(x), r1=169(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=405(x), r6=57(y), r7=87(width), r8=16(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 169
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 405
LDI r6, 57
LDI r7, 87
LDI r8, 16
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
