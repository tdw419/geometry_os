; DESCRIPTION: Composite: Places a blue line segment connecting (21, 35) to (143, 59) then Renders a white box of size 71x62 starting at (46, 18).
; PLAN: r0=21(x1), r1=35(y1), r2=143(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=46(x), r6=18(y), r7=71(width), r8=62(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 21
LDI r1, 35
LDI r2, 143
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 18
LDI r7, 71
LDI r8, 62
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
