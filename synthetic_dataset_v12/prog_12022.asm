; DESCRIPTION: Composite: Draws a black line from (244, 64) to (7, 210) then Places a black 113x70 rectangle at position (169, 126) then Places a cyan dot at position (218, 15).
; PLAN: r0=244(x1), r1=64(y1), r2=7(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=126(y), r7=113(width), r8=70(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=218(x), r11=15(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 244
LDI r1, 64
LDI r2, 7
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 126
LDI r7, 113
LDI r8, 70
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 218
LDI r11, 15
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
