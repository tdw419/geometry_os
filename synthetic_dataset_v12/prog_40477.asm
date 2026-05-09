; DESCRIPTION: Composite: Renders a blue disk with center (401, 135) and radius 60 then Places a blue dot at position (10, 177) then Draws a green line from (370, 22) to (70, 250).
; PLAN: r0=401(x), r1=135(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=10(x), r6=177(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=370(x1), r11=22(y1), r12=70(x2), r13=250(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 135
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 10
LDI r6, 177
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 370
LDI r11, 22
LDI r12, 70
LDI r13, 250
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
