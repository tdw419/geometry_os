; DESCRIPTION: Composite: Places a red circle of radius 12 at center (187, 225) then Sets a single green pixel at (307, 143) then Renders a orange box of size 93x54 starting at (242, 177).
; PLAN: r0=187(x), r1=225(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x), r6=143(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=242(x), r11=177(y), r12=93(width), r13=54(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 187
LDI r1, 225
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 143
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 242
LDI r11, 177
LDI r12, 93
LDI r13, 54
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
