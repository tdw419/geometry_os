; DESCRIPTION: Composite: . Then Places a blue circle of radius 31 at center (225, 112). Then Renders a red box of size 80x96 starting at (158, 154).
; PLAN: r0=225(x), r1=112(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=158(x), r1=154(y), r2=80(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue circle of radius 31 at center (225, 112).
; PLAN: r0=225(x), r1=112(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 112
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red box of size 80x96 starting at (158, 154).
; PLAN: r0=158(x), r1=154(y), r2=80(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 154
LDI r2, 80
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
