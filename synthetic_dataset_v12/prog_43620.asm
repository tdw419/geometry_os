; DESCRIPTION: Composite: Places a cyan 93x100 rectangle at position (231, 62) then Renders a orange line between points (401, 191) and (122, 132) then Places a blue dot at position (372, 217).
; PLAN: r0=231(x), r1=62(y), r2=93(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x1), r6=191(y1), r7=122(x2), r8=132(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=372(x), r11=217(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 231
LDI r1, 62
LDI r2, 93
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 191
LDI r7, 122
LDI r8, 132
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 372
LDI r11, 217
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
