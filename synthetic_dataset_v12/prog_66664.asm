; DESCRIPTION: Composite: Renders a cyan disk with center (60, 59) and radius 12 then Draws a black rectangle at (115, 47) with width 112 and height 71.
; PLAN: r0=60(x), r1=59(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x), r6=47(y), r7=112(width), r8=71(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 60
LDI r1, 59
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 47
LDI r7, 112
LDI r8, 71
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
