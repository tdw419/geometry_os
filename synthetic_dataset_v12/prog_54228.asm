; DESCRIPTION: Composite: Renders a cyan box of size 29x46 starting at (71, 165) then Places a white line segment connecting (247, 247) to (321, 65).
; PLAN: r0=71(x), r1=165(y), r2=29(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=247(x1), r6=247(y1), r7=321(x2), r8=65(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 71
LDI r1, 165
LDI r2, 29
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 247
LDI r7, 321
LDI r8, 65
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
