; DESCRIPTION: Composite: Renders a cyan box of size 106x59 starting at (92, 125) then Draws a green circle centered at (321, 92) with radius 58.
; PLAN: r0=92(x), r1=125(y), r2=106(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x), r6=92(y), r7=58(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 92
LDI r1, 125
LDI r2, 106
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 92
LDI r7, 58
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
