; DESCRIPTION: Composite: Places a yellow 101x82 rectangle at position (380, 107) then Renders a black line between points (255, 172) and (251, 62) then Places a blue dot at position (492, 126).
; PLAN: r0=380(x), r1=107(y), r2=101(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x1), r6=172(y1), r7=251(x2), r8=62(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=492(x), r11=126(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 380
LDI r1, 107
LDI r2, 101
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 172
LDI r7, 251
LDI r8, 62
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 492
LDI r11, 126
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
