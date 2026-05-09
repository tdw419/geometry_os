; DESCRIPTION: Composite: Renders a black box of size 30x84 starting at (465, 126) then Renders a cyan disk with center (408, 198) and radius 43.
; PLAN: r0=465(x), r1=126(y), r2=30(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=408(x), r6=198(y), r7=43(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 465
LDI r1, 126
LDI r2, 30
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 198
LDI r7, 43
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
