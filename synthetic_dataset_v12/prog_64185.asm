; DESCRIPTION: Composite: Creates a orange circular shape at (364, 221) with radius 16 then Renders a green line between points (404, 234) and (502, 23) then Places a cyan 45x114 rectangle at position (190, 40).
; PLAN: r0=364(x), r1=221(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=404(x1), r6=234(y1), r7=502(x2), r8=23(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=190(x), r11=40(y), r12=45(width), r13=114(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 221
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 404
LDI r6, 234
LDI r7, 502
LDI r8, 23
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 190
LDI r11, 40
LDI r12, 45
LDI r13, 114
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
