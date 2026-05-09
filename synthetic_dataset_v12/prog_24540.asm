; DESCRIPTION: Composite: Renders a magenta line between points (15, 124) and (194, 214) then Renders a red box of size 77x48 starting at (406, 29).
; PLAN: r0=15(x1), r1=124(y1), r2=194(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=29(y), r7=77(width), r8=48(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 15
LDI r1, 124
LDI r2, 194
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 29
LDI r7, 77
LDI r8, 48
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
