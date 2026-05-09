; DESCRIPTION: Composite: Creates a cyan rectangular region at (4, 239) spanning 101 by 17 pixels then Sets a single white pixel at (337, 82) then Draws a cyan line from (82, 227) to (432, 42).
; PLAN: r0=4(x), r1=239(y), r2=101(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=337(x), r6=82(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=82(x1), r11=227(y1), r12=432(x2), r13=42(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 4
LDI r1, 239
LDI r2, 101
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 82
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 82
LDI r11, 227
LDI r12, 432
LDI r13, 42
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
