; DESCRIPTION: Composite: Creates a yellow rectangular region at (212, 28) spanning 43 by 18 pixels then Renders a cyan line between points (64, 142) and (436, 106).
; PLAN: r0=212(x), r1=28(y), r2=43(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=64(x1), r6=142(y1), r7=436(x2), r8=106(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 28
LDI r2, 43
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 142
LDI r7, 436
LDI r8, 106
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
