; DESCRIPTION: Composite: Draws a cyan rectangle at (64, 168) with width 35 and height 50 then Sets a single cyan pixel at (5, 135) then Places a cyan line segment connecting (461, 223) to (254, 133).
; PLAN: r0=64(x), r1=168(y), r2=35(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=5(x), r6=135(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=461(x1), r11=223(y1), r12=254(x2), r13=133(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 64
LDI r1, 168
LDI r2, 35
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 135
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 461
LDI r11, 223
LDI r12, 254
LDI r13, 133
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
