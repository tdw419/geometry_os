; DESCRIPTION: Composite: Places a white line segment connecting (90, 75) to (410, 50) then Sets a single white pixel at (459, 221) then Renders a red box of size 33x63 starting at (31, 43).
; PLAN: r0=90(x1), r1=75(y1), r2=410(x2), r3=50(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=459(x), r6=221(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=31(x), r11=43(y), r12=33(width), r13=63(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 90
LDI r1, 75
LDI r2, 410
LDI r3, 50
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 221
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 31
LDI r11, 43
LDI r12, 33
LDI r13, 63
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
