; DESCRIPTION: Composite: Places a red 89x79 rectangle at position (2, 149) then Places a orange dot at position (422, 212) then Renders a green line between points (435, 56) and (47, 184).
; PLAN: r0=2(x), r1=149(y), r2=89(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x), r6=212(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=435(x1), r11=56(y1), r12=47(x2), r13=184(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 2
LDI r1, 149
LDI r2, 89
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 212
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 435
LDI r11, 56
LDI r12, 47
LDI r13, 184
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
