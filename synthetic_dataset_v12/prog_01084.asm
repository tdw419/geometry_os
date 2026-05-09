; DESCRIPTION: Composite: Renders a red box of size 54x110 starting at (25, 35) then Renders a green line between points (227, 78) and (255, 46).
; PLAN: r0=25(x), r1=35(y), r2=54(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x1), r6=78(y1), r7=255(x2), r8=46(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 25
LDI r1, 35
LDI r2, 54
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 78
LDI r7, 255
LDI r8, 46
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
