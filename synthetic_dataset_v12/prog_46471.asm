; DESCRIPTION: Composite: Renders a orange line between points (92, 81) and (461, 233) then Creates a orange rectangular region at (425, 128) spanning 38 by 103 pixels then Sets a single white pixel at (410, 24).
; PLAN: r0=92(x1), r1=81(y1), r2=461(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=425(x), r6=128(y), r7=38(width), r8=103(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=410(x), r11=24(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 92
LDI r1, 81
LDI r2, 461
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 128
LDI r7, 38
LDI r8, 103
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 410
LDI r11, 24
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
