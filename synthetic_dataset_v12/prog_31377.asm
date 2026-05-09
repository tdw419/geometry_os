; DESCRIPTION: Composite: Renders a green line between points (46, 93) and (342, 70) then Renders a magenta box of size 20x84 starting at (86, 40).
; PLAN: r0=46(x1), r1=93(y1), r2=342(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=40(y), r7=20(width), r8=84(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 46
LDI r1, 93
LDI r2, 342
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 40
LDI r7, 20
LDI r8, 84
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
