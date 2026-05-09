; DESCRIPTION: Composite: Places a white 61x52 rectangle at position (301, 35) then Sets a single green pixel at (209, 144) then Renders a green line between points (164, 191) and (11, 70).
; PLAN: r0=301(x), r1=35(y), r2=61(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x), r6=144(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=164(x1), r11=191(y1), r12=11(x2), r13=70(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 35
LDI r2, 61
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 144
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 164
LDI r11, 191
LDI r12, 11
LDI r13, 70
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
