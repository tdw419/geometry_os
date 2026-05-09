; DESCRIPTION: Composite: Creates a green rectangular region at (146, 4) spanning 108 by 58 pixels then Renders a cyan disk with center (367, 152) and radius 49 then Places a red dot at position (250, 51).
; PLAN: r0=146(x), r1=4(y), r2=108(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=367(x), r6=152(y), r7=49(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=250(x), r11=51(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 146
LDI r1, 4
LDI r2, 108
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 152
LDI r7, 49
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 250
LDI r11, 51
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
