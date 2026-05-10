; DESCRIPTION: Composite: Places a yellow 35x78 rectangle at position (113, 174) then Renders a magenta line between points (119, 59) and (415, 98).
; PLAN: r0=113(x), r1=174(y), r2=35(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=119(x1), r6=59(y1), r7=415(x2), r8=98(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 174
LDI r2, 35
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 59
LDI r7, 415
LDI r8, 98
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
