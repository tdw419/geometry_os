; DESCRIPTION: Composite: Places a cyan line segment connecting (176, 253) to (492, 17) then Creates a green rectangular region at (313, 102) spanning 16 by 39 pixels.
; PLAN: r0=176(x1), r1=253(y1), r2=492(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=313(x), r6=102(y), r7=16(width), r8=39(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 253
LDI r2, 492
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 102
LDI r7, 16
LDI r8, 39
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
