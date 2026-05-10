; DESCRIPTION: Composite: Creates a cyan rectangular region at (219, 94) spanning 82 by 95 pixels then Draws a black line from (363, 173) to (84, 62) then Sets a single white pixel at (213, 175).
; PLAN: r0=219(x), r1=94(y), r2=82(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=363(x1), r6=173(y1), r7=84(x2), r8=62(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=213(x), r11=175(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 219
LDI r1, 94
LDI r2, 82
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 173
LDI r7, 84
LDI r8, 62
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 175
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
