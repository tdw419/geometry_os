; DESCRIPTION: Composite: Places a blue dot at position (384, 40) then Renders a red box of size 66x87 starting at (139, 47) then Places a cyan circle of radius 60 at center (174, 112).
; PLAN: r0=384(x), r1=40(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=139(x), r6=47(y), r7=66(width), r8=87(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=174(x), r11=112(y), r12=60(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 384
LDI r1, 40
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 139
LDI r6, 47
LDI r7, 66
LDI r8, 87
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 174
LDI r11, 112
LDI r12, 60
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
