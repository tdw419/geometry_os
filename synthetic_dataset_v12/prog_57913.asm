; DESCRIPTION: Composite: Renders a blue line between points (38, 26) and (174, 46) then Renders a black box of size 75x100 starting at (108, 48).
; PLAN: r0=38(x1), r1=26(y1), r2=174(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=108(x), r6=48(y), r7=75(width), r8=100(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 38
LDI r1, 26
LDI r2, 174
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 48
LDI r7, 75
LDI r8, 100
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
