; DESCRIPTION: Composite: Creates a red rectangular region at (242, 26) spanning 119 by 107 pixels then Sets a single green pixel at (123, 146) then Renders a cyan disk with center (101, 225) and radius 20.
; PLAN: r0=242(x), r1=26(y), r2=119(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=146(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=101(x), r11=225(y), r12=20(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 242
LDI r1, 26
LDI r2, 119
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 146
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 101
LDI r11, 225
LDI r12, 20
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
