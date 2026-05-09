; DESCRIPTION: Composite: Renders a yellow line between points (479, 49) and (307, 61) then Renders a green box of size 119x49 starting at (385, 13).
; PLAN: r0=479(x1), r1=49(y1), r2=307(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=385(x), r6=13(y), r7=119(width), r8=49(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 479
LDI r1, 49
LDI r2, 307
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 13
LDI r7, 119
LDI r8, 49
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
