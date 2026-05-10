; DESCRIPTION: Composite: Renders a orange box of size 48x111 starting at (348, 38) then Renders a green line between points (445, 78) and (308, 212) then Places a purple dot at position (142, 160).
; PLAN: r0=348(x), r1=38(y), r2=48(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x1), r6=78(y1), r7=308(x2), r8=212(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=142(x), r11=160(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 348
LDI r1, 38
LDI r2, 48
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 78
LDI r7, 308
LDI r8, 212
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 160
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
