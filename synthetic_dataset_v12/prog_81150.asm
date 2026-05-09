; DESCRIPTION: Composite: Draws a black line from (42, 206) to (192, 137) then Renders a cyan box of size 39x73 starting at (346, 172) then Places a green dot at position (62, 123).
; PLAN: r0=42(x1), r1=206(y1), r2=192(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=172(y), r7=39(width), r8=73(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=62(x), r11=123(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 42
LDI r1, 206
LDI r2, 192
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 172
LDI r7, 39
LDI r8, 73
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 123
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
