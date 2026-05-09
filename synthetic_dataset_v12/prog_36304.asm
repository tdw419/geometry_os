; DESCRIPTION: Composite: Places a orange 107x71 rectangle at position (96, 86) then Draws a magenta line from (445, 199) to (106, 242) then Places a cyan dot at position (72, 188).
; PLAN: r0=96(x), r1=86(y), r2=107(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x1), r6=199(y1), r7=106(x2), r8=242(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=72(x), r11=188(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 96
LDI r1, 86
LDI r2, 107
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 199
LDI r7, 106
LDI r8, 242
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 72
LDI r11, 188
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
