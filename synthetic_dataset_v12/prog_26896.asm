; DESCRIPTION: Composite: Sets a single green pixel at (223, 146) then Places a cyan circle of radius 76 at center (331, 118) then Renders a red box of size 98x98 starting at (7, 142).
; PLAN: r0=223(x), r1=146(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=331(x), r6=118(y), r7=76(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=7(x), r11=142(y), r12=98(width), r13=98(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 223
LDI r1, 146
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 331
LDI r6, 118
LDI r7, 76
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 7
LDI r11, 142
LDI r12, 98
LDI r13, 98
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
