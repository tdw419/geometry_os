; DESCRIPTION: Composite: Renders a cyan box of size 52x86 starting at (244, 31) then Renders a green line between points (175, 204) and (366, 110) then Places a purple dot at position (365, 26).
; PLAN: r0=244(x), r1=31(y), r2=52(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=175(x1), r6=204(y1), r7=366(x2), r8=110(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=365(x), r11=26(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 244
LDI r1, 31
LDI r2, 52
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 204
LDI r7, 366
LDI r8, 110
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 26
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
