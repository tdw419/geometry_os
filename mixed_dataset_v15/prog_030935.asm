; DESCRIPTION: Composite: Places a green dot at position (114, 95) then Renders a red disk with center (173, 198) and radius 56.
; PLAN: r0=114(x), r1=95(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=173(x), r6=198(y), r7=56(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 114
LDI r1, 95
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 173
LDI r6, 198
LDI r7, 56
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
