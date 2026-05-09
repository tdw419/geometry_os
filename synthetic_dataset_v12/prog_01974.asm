; DESCRIPTION: Composite: Renders a red box of size 46x79 starting at (183, 161) then Renders a black line between points (28, 205) and (493, 65) then Places a cyan dot at position (359, 42).
; PLAN: r0=183(x), r1=161(y), r2=46(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=28(x1), r6=205(y1), r7=493(x2), r8=65(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=359(x), r11=42(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 183
LDI r1, 161
LDI r2, 46
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 28
LDI r6, 205
LDI r7, 493
LDI r8, 65
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 359
LDI r11, 42
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
