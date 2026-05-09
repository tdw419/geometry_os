; DESCRIPTION: Composite: Creates a cyan rectangular region at (95, 60) spanning 24 by 32 pixels then Draws a white circle centered at (436, 71) with radius 61.
; PLAN: r0=95(x), r1=60(y), r2=24(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x), r6=71(y), r7=61(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 95
LDI r1, 60
LDI r2, 24
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 71
LDI r7, 61
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
