; DESCRIPTION: Composite: Creates a cyan rectangular region at (260, 161) spanning 109 by 38 pixels then Places a magenta line segment connecting (66, 242) to (470, 212) then Places a white dot at position (488, 68).
; PLAN: r0=260(x), r1=161(y), r2=109(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x1), r6=242(y1), r7=470(x2), r8=212(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=488(x), r11=68(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 260
LDI r1, 161
LDI r2, 109
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 242
LDI r7, 470
LDI r8, 212
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 488
LDI r11, 68
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
