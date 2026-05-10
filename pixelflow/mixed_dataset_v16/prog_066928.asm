; DESCRIPTION: Composite: Creates a red rectangular region at (445, 38) spanning 51 by 107 pixels then Renders a black disk with center (450, 111) and radius 49 then Sets a single white pixel at (369, 70).
; PLAN: r0=445(x), r1=38(y), r2=51(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=450(x), r6=111(y), r7=49(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=369(x), r11=70(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 445
LDI r1, 38
LDI r2, 51
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 111
LDI r7, 49
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 369
LDI r11, 70
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
