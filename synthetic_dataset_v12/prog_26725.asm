; DESCRIPTION: Composite: Renders a cyan disk with center (124, 148) and radius 51 then Places a cyan 44x48 rectangle at position (271, 58) then Places a orange line segment connecting (99, 220) to (487, 198).
; PLAN: r0=124(x), r1=148(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=271(x), r6=58(y), r7=44(width), r8=48(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=99(x1), r11=220(y1), r12=487(x2), r13=198(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 124
LDI r1, 148
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 271
LDI r6, 58
LDI r7, 44
LDI r8, 48
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 220
LDI r12, 487
LDI r13, 198
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
