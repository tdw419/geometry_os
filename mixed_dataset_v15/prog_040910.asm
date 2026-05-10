; DESCRIPTION: Composite: Draws a cyan line from (326, 50) to (161, 37) then Creates a red rectangular region at (84, 113) spanning 10 by 45 pixels.
; PLAN: r0=326(x1), r1=50(y1), r2=161(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=113(y), r7=10(width), r8=45(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 326
LDI r1, 50
LDI r2, 161
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 113
LDI r7, 10
LDI r8, 45
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
