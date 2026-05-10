; DESCRIPTION: Composite: Creates a white rectangular region at (59, 82) spanning 96 by 21 pixels then Draws a blue line from (214, 242) to (18, 9) then Places a yellow dot at position (333, 13).
; PLAN: r0=59(x), r1=82(y), r2=96(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=214(x1), r6=242(y1), r7=18(x2), r8=9(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=333(x), r11=13(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 59
LDI r1, 82
LDI r2, 96
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 242
LDI r7, 18
LDI r8, 9
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 13
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
