; DESCRIPTION: Composite: Renders a green line between points (386, 178) and (442, 96) then Creates a green rectangular region at (423, 59) spanning 50 by 53 pixels.
; PLAN: r0=386(x1), r1=178(y1), r2=442(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=423(x), r6=59(y), r7=50(width), r8=53(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 386
LDI r1, 178
LDI r2, 442
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 59
LDI r7, 50
LDI r8, 53
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
