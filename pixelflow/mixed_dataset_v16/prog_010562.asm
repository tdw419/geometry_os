; DESCRIPTION: Composite: Places a cyan 35x113 rectangle at position (171, 70) then Draws a blue line from (207, 224) to (241, 55) then Places a blue dot at position (140, 255).
; PLAN: r0=171(x), r1=70(y), r2=35(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x1), r6=224(y1), r7=241(x2), r8=55(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=140(x), r11=255(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 171
LDI r1, 70
LDI r2, 35
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 224
LDI r7, 241
LDI r8, 55
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 140
LDI r11, 255
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
