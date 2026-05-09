; DESCRIPTION: Composite: Creates a cyan circular shape at (95, 133) with radius 74 then Draws a cyan rectangle at (469, 59) with width 41 and height 83 then Sets a single green pixel at (50, 48).
; PLAN: r0=95(x), r1=133(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=469(x), r6=59(y), r7=41(width), r8=83(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=50(x), r11=48(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 95
LDI r1, 133
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 469
LDI r6, 59
LDI r7, 41
LDI r8, 83
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 50
LDI r11, 48
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
