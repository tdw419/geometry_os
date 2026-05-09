; DESCRIPTION: Composite: Renders a red box of size 17x76 starting at (371, 144) then Renders a yellow disk with center (387, 168) and radius 78 then Draws a magenta line from (487, 161) to (371, 119).
; PLAN: r0=371(x), r1=144(y), r2=17(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x), r6=168(y), r7=78(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=487(x1), r11=161(y1), r12=371(x2), r13=119(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 371
LDI r1, 144
LDI r2, 17
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 168
LDI r7, 78
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 487
LDI r11, 161
LDI r12, 371
LDI r13, 119
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
