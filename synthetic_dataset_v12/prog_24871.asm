; DESCRIPTION: Composite: Creates a blue rectangular region at (368, 87) spanning 48 by 34 pixels then Places a cyan dot at position (176, 228) then Creates a blue circular shape at (240, 161) with radius 70.
; PLAN: r0=368(x), r1=87(y), r2=48(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=176(x), r6=228(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=240(x), r11=161(y), r12=70(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 368
LDI r1, 87
LDI r2, 48
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 228
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 240
LDI r11, 161
LDI r12, 70
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
