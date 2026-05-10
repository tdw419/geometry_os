; DESCRIPTION: Composite: Renders a red line between points (167, 200) and (64, 29) then Renders a blue box of size 101x11 starting at (299, 208).
; PLAN: r0=167(x1), r1=200(y1), r2=64(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=208(y), r7=101(width), r8=11(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 200
LDI r2, 64
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 208
LDI r7, 101
LDI r8, 11
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
