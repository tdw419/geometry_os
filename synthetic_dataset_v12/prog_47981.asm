; DESCRIPTION: Composite: Draws a green line from (66, 54) to (406, 222) then Renders a red box of size 33x59 starting at (253, 126).
; PLAN: r0=66(x1), r1=54(y1), r2=406(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=126(y), r7=33(width), r8=59(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 66
LDI r1, 54
LDI r2, 406
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 126
LDI r7, 33
LDI r8, 59
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
