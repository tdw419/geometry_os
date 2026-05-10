; DESCRIPTION: Composite: Renders a yellow box of size 42x44 starting at (92, 46) then Draws a cyan line from (109, 8) to (296, 184) then Places a blue dot at position (213, 253).
; PLAN: r0=92(x), r1=46(y), r2=42(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=109(x1), r6=8(y1), r7=296(x2), r8=184(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=213(x), r11=253(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 92
LDI r1, 46
LDI r2, 42
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 8
LDI r7, 296
LDI r8, 184
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 253
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
