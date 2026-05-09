; DESCRIPTION: Composite: Draws a cyan rectangle at (239, 44) with width 70 and height 13 then Renders a cyan line between points (229, 128) and (477, 255).
; PLAN: r0=239(x), r1=44(y), r2=70(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=229(x1), r6=128(y1), r7=477(x2), r8=255(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 44
LDI r2, 70
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 128
LDI r7, 477
LDI r8, 255
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
