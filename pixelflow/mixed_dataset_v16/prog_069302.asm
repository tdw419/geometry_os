; DESCRIPTION: Composite: Renders a orange box of size 16x72 starting at (334, 71) then Renders a magenta line between points (193, 161) and (346, 108) then Places a cyan dot at position (5, 238).
; PLAN: r0=334(x), r1=71(y), r2=16(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=193(x1), r6=161(y1), r7=346(x2), r8=108(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=5(x), r11=238(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 334
LDI r1, 71
LDI r2, 16
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 161
LDI r7, 346
LDI r8, 108
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 5
LDI r11, 238
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
