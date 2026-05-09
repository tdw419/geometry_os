; DESCRIPTION: Composite: Renders a red box of size 53x104 starting at (394, 95) then Places a orange dot at position (289, 237) then Places a cyan line segment connecting (337, 159) to (200, 80).
; PLAN: r0=394(x), r1=95(y), r2=53(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x), r6=237(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=337(x1), r11=159(y1), r12=200(x2), r13=80(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 394
LDI r1, 95
LDI r2, 53
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 237
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 337
LDI r11, 159
LDI r12, 200
LDI r13, 80
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
