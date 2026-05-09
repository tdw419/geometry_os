; DESCRIPTION: Composite: Renders a purple box of size 93x43 starting at (99, 70) then Draws a magenta line from (445, 86) to (73, 202) then Places a purple dot at position (295, 2).
; PLAN: r0=99(x), r1=70(y), r2=93(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x1), r6=86(y1), r7=73(x2), r8=202(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=295(x), r11=2(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 99
LDI r1, 70
LDI r2, 93
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 86
LDI r7, 73
LDI r8, 202
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 295
LDI r11, 2
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
