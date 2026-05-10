; DESCRIPTION: Composite: Renders a green box of size 84x87 starting at (352, 146) then Renders a cyan disk with center (382, 106) and radius 40 then Sets a single yellow pixel at (456, 31).
; PLAN: r0=352(x), r1=146(y), r2=84(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=382(x), r6=106(y), r7=40(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=456(x), r11=31(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 352
LDI r1, 146
LDI r2, 84
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 106
LDI r7, 40
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 456
LDI r11, 31
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
