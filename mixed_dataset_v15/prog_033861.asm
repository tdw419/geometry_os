; DESCRIPTION: Composite: Places a green line segment connecting (303, 233) to (100, 96) then Renders a cyan box of size 99x88 starting at (288, 69).
; PLAN: r0=303(x1), r1=233(y1), r2=100(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=69(y), r7=99(width), r8=88(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 233
LDI r2, 100
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 69
LDI r7, 99
LDI r8, 88
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
