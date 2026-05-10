; DESCRIPTION: Composite: Renders a magenta disk with center (256, 175) and radius 55 then Sets a single white pixel at (392, 59) then Places a magenta line segment connecting (240, 219) to (162, 27).
; PLAN: r0=256(x), r1=175(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=392(x), r6=59(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=240(x1), r11=219(y1), r12=162(x2), r13=27(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 175
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 392
LDI r6, 59
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 240
LDI r11, 219
LDI r12, 162
LDI r13, 27
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
