; DESCRIPTION: Composite: Renders a purple box of size 79x35 starting at (142, 169) then Renders a red disk with center (135, 208) and radius 14 then Places a cyan dot at position (263, 13).
; PLAN: r0=142(x), r1=169(y), r2=79(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=135(x), r6=208(y), r7=14(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=263(x), r11=13(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 142
LDI r1, 169
LDI r2, 79
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 208
LDI r7, 14
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 263
LDI r11, 13
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
