; DESCRIPTION: Composite: Creates a yellow circular shape at (234, 150) with radius 41 then Renders a black line between points (386, 47) and (101, 154) then Places a green 63x90 rectangle at position (202, 18).
; PLAN: r0=234(x), r1=150(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=386(x1), r6=47(y1), r7=101(x2), r8=154(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=202(x), r11=18(y), r12=63(width), r13=90(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 150
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 386
LDI r6, 47
LDI r7, 101
LDI r8, 154
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 18
LDI r12, 63
LDI r13, 90
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
