; DESCRIPTION: Composite: Creates a green circular shape at (119, 211) with radius 32 then Places a cyan 64x109 rectangle at position (403, 33) then Draws a white line from (471, 83) to (251, 169).
; PLAN: r0=119(x), r1=211(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=403(x), r6=33(y), r7=64(width), r8=109(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=471(x1), r11=83(y1), r12=251(x2), r13=169(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 119
LDI r1, 211
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 403
LDI r6, 33
LDI r7, 64
LDI r8, 109
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 471
LDI r11, 83
LDI r12, 251
LDI r13, 169
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
