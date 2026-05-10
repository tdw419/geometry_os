; DESCRIPTION: Composite: Creates a cyan circular shape at (389, 151) with radius 63 then Places a white 55x66 rectangle at position (307, 165) then Renders a cyan line between points (297, 154) and (475, 167).
; PLAN: r0=389(x), r1=151(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x), r6=165(y), r7=55(width), r8=66(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=297(x1), r11=154(y1), r12=475(x2), r13=167(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 389
LDI r1, 151
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 165
LDI r7, 55
LDI r8, 66
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 154
LDI r12, 475
LDI r13, 167
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
