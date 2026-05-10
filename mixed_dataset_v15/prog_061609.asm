; DESCRIPTION: Composite: Draws a cyan rectangle at (153, 164) with width 96 and height 82 then Renders a magenta line between points (32, 99) and (320, 78) then Places a cyan dot at position (236, 214).
; PLAN: r0=153(x), r1=164(y), r2=96(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=32(x1), r6=99(y1), r7=320(x2), r8=78(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=236(x), r11=214(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 153
LDI r1, 164
LDI r2, 96
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 99
LDI r7, 320
LDI r8, 78
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 236
LDI r11, 214
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
