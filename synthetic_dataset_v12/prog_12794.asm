; DESCRIPTION: Composite: Places a cyan dot at position (488, 206) then Renders a red box of size 96x53 starting at (98, 123) then Draws a red line from (451, 149) to (338, 65).
; PLAN: r0=488(x), r1=206(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=98(x), r6=123(y), r7=96(width), r8=53(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=451(x1), r11=149(y1), r12=338(x2), r13=65(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 488
LDI r1, 206
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 98
LDI r6, 123
LDI r7, 96
LDI r8, 53
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 149
LDI r12, 338
LDI r13, 65
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
