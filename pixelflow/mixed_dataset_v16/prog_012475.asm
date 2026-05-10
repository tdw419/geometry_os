; DESCRIPTION: Composite: Places a green line segment connecting (374, 126) to (437, 126) then Draws a yellow rectangle at (218, 28) with width 42 and height 99 then Places a green dot at position (337, 75).
; PLAN: r0=374(x1), r1=126(y1), r2=437(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=28(y), r7=42(width), r8=99(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=337(x), r11=75(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 374
LDI r1, 126
LDI r2, 437
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 28
LDI r7, 42
LDI r8, 99
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 75
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
