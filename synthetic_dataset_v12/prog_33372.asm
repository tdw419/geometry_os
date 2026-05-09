; DESCRIPTION: Composite: Places a white dot at position (503, 165) then Places a blue 83x103 rectangle at position (296, 26) then Creates a cyan circular shape at (59, 214) with radius 36.
; PLAN: r0=503(x), r1=165(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=296(x), r6=26(y), r7=83(width), r8=103(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=59(x), r11=214(y), r12=36(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 503
LDI r1, 165
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 296
LDI r6, 26
LDI r7, 83
LDI r8, 103
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 214
LDI r12, 36
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
