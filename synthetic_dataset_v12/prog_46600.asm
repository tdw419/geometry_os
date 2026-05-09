; DESCRIPTION: Composite: Draws a blue line from (403, 47) to (406, 80) then Renders a black box of size 24x33 starting at (487, 134) then Places a black circle of radius 50 at center (346, 158).
; PLAN: r0=403(x1), r1=47(y1), r2=406(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=487(x), r6=134(y), r7=24(width), r8=33(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=346(x), r11=158(y), r12=50(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 403
LDI r1, 47
LDI r2, 406
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 134
LDI r7, 24
LDI r8, 33
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 158
LDI r12, 50
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
