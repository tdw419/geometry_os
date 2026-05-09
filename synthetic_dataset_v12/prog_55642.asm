; DESCRIPTION: Composite: Renders a orange box of size 38x81 starting at (386, 33) then Renders a cyan line between points (498, 0) and (75, 151) then Renders a black disk with center (328, 61) and radius 39.
; PLAN: r0=386(x), r1=33(y), r2=38(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=498(x1), r6=0(y1), r7=75(x2), r8=151(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=328(x), r11=61(y), r12=39(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 386
LDI r1, 33
LDI r2, 38
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 498
LDI r6, 0
LDI r7, 75
LDI r8, 151
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 328
LDI r11, 61
LDI r12, 39
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
