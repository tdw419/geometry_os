; DESCRIPTION: Composite: Draws a black circle centered at (386, 161) with radius 59 then Renders a green box of size 106x94 starting at (12, 120) then Places a cyan line segment connecting (286, 19) to (403, 98).
; PLAN: r0=386(x), r1=161(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=12(x), r6=120(y), r7=106(width), r8=94(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=286(x1), r11=19(y1), r12=403(x2), r13=98(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 161
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 12
LDI r6, 120
LDI r7, 106
LDI r8, 94
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 286
LDI r11, 19
LDI r12, 403
LDI r13, 98
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
