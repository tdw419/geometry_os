; DESCRIPTION: Composite: Places a magenta dot at position (53, 114) then Places a white 40x39 rectangle at position (260, 128) then Renders a black line between points (462, 169) and (184, 111).
; PLAN: r0=53(x), r1=114(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=260(x), r6=128(y), r7=40(width), r8=39(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=462(x1), r11=169(y1), r12=184(x2), r13=111(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 53
LDI r1, 114
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 260
LDI r6, 128
LDI r7, 40
LDI r8, 39
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 462
LDI r11, 169
LDI r12, 184
LDI r13, 111
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
