; DESCRIPTION: Composite: Renders a purple line between points (434, 162) and (421, 135) then Places a orange circle of radius 79 at center (401, 98) then Sets a single magenta pixel at (280, 67).
; PLAN: r0=434(x1), r1=162(y1), r2=421(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=401(x), r6=98(y), r7=79(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=280(x), r11=67(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 434
LDI r1, 162
LDI r2, 421
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 98
LDI r7, 79
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 280
LDI r11, 67
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
