; DESCRIPTION: Composite: Places a green circle of radius 41 at center (429, 183) then Sets a single purple pixel at (361, 80) then Renders a orange box of size 93x14 starting at (242, 134).
; PLAN: r0=429(x), r1=183(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=361(x), r6=80(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=242(x), r11=134(y), r12=93(width), r13=14(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 183
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 361
LDI r6, 80
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 242
LDI r11, 134
LDI r12, 93
LDI r13, 14
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
