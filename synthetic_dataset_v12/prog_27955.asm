; DESCRIPTION: Composite: Renders a black line between points (385, 193) and (5, 24) then Renders a yellow box of size 55x18 starting at (214, 3).
; PLAN: r0=385(x1), r1=193(y1), r2=5(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=3(y), r7=55(width), r8=18(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 385
LDI r1, 193
LDI r2, 5
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 3
LDI r7, 55
LDI r8, 18
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
