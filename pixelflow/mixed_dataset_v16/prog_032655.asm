; DESCRIPTION: Composite: Places a cyan line segment connecting (16, 236) to (386, 223) then Creates a blue rectangular region at (0, 90) spanning 108 by 40 pixels.
; PLAN: r0=16(x1), r1=236(y1), r2=386(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=0(x), r6=90(y), r7=108(width), r8=40(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 16
LDI r1, 236
LDI r2, 386
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 90
LDI r7, 108
LDI r8, 40
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
