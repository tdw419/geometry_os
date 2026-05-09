; DESCRIPTION: Composite: Renders a red line between points (168, 182) and (320, 200) then Sets a single black pixel at (320, 47) then Creates a red rectangular region at (337, 133) spanning 44 by 95 pixels.
; PLAN: r0=168(x1), r1=182(y1), r2=320(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=47(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=337(x), r11=133(y), r12=44(width), r13=95(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 182
LDI r2, 320
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 47
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 337
LDI r11, 133
LDI r12, 44
LDI r13, 95
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
