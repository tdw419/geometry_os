; DESCRIPTION: Composite: Places a green 23x23 rectangle at position (307, 65) then Renders a black line between points (79, 153) and (372, 140).
; PLAN: r0=307(x), r1=65(y), r2=23(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x1), r6=153(y1), r7=372(x2), r8=140(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 65
LDI r2, 23
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 153
LDI r7, 372
LDI r8, 140
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
