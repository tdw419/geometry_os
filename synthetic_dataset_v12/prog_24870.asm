; DESCRIPTION: Composite: Creates a purple rectangular region at (279, 127) spanning 33 by 92 pixels then Renders a green disk with center (61, 94) and radius 33.
; PLAN: r0=279(x), r1=127(y), r2=33(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=61(x), r6=94(y), r7=33(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 279
LDI r1, 127
LDI r2, 33
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 94
LDI r7, 33
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
