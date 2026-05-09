; DESCRIPTION: Composite: Renders a black box of size 35x72 starting at (395, 11) then Places a cyan dot at position (360, 131) then Renders a green disk with center (363, 61) and radius 28.
; PLAN: r0=395(x), r1=11(y), r2=35(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=360(x), r6=131(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=363(x), r11=61(y), r12=28(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 395
LDI r1, 11
LDI r2, 35
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 131
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 363
LDI r11, 61
LDI r12, 28
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
