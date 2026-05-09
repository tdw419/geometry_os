; DESCRIPTION: Composite: Renders a red line between points (252, 231) and (85, 127) then Places a green dot at position (437, 23) then Places a cyan 56x99 rectangle at position (283, 37).
; PLAN: r0=252(x1), r1=231(y1), r2=85(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=437(x), r6=23(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=283(x), r11=37(y), r12=56(width), r13=99(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 231
LDI r2, 85
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 23
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 283
LDI r11, 37
LDI r12, 56
LDI r13, 99
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
