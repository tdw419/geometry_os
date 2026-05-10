; DESCRIPTION: Composite: Renders a cyan box of size 43x108 starting at (445, 123) then Draws a purple line from (37, 43) to (168, 65) then Sets a single orange pixel at (102, 209).
; PLAN: r0=445(x), r1=123(y), r2=43(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=37(x1), r6=43(y1), r7=168(x2), r8=65(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=102(x), r11=209(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 445
LDI r1, 123
LDI r2, 43
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 43
LDI r7, 168
LDI r8, 65
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 209
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
