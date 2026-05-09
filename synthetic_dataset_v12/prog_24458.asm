; DESCRIPTION: Composite: Places a blue dot at position (17, 162) then Renders a green box of size 39x11 starting at (359, 121) then Places a cyan line segment connecting (429, 129) to (511, 74).
; PLAN: r0=17(x), r1=162(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=121(y), r7=39(width), r8=11(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=429(x1), r11=129(y1), r12=511(x2), r13=74(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 17
LDI r1, 162
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 359
LDI r6, 121
LDI r7, 39
LDI r8, 11
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 429
LDI r11, 129
LDI r12, 511
LDI r13, 74
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
