; DESCRIPTION: Composite: Renders a blue box of size 64x65 starting at (368, 133) then Renders a cyan line between points (359, 244) and (41, 128).
; PLAN: r0=368(x), r1=133(y), r2=64(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=359(x1), r6=244(y1), r7=41(x2), r8=128(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 133
LDI r2, 64
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 244
LDI r7, 41
LDI r8, 128
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
