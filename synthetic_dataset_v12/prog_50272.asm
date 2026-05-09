; DESCRIPTION: Composite: Draws a yellow rectangle at (386, 25) with width 115 and height 93 then Renders a cyan line between points (369, 206) and (81, 70).
; PLAN: r0=386(x), r1=25(y), r2=115(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=369(x1), r6=206(y1), r7=81(x2), r8=70(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 386
LDI r1, 25
LDI r2, 115
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 206
LDI r7, 81
LDI r8, 70
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
