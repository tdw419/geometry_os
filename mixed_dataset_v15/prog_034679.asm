; DESCRIPTION: Composite: Places a purple dot at position (242, 240) then Renders a cyan disk with center (365, 143) and radius 56 then Renders a yellow box of size 65x10 starting at (30, 127).
; PLAN: r0=242(x), r1=240(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=365(x), r6=143(y), r7=56(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=30(x), r11=127(y), r12=65(width), r13=10(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 242
LDI r1, 240
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 365
LDI r6, 143
LDI r7, 56
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 30
LDI r11, 127
LDI r12, 65
LDI r13, 10
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
