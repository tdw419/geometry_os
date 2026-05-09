; DESCRIPTION: Composite: Renders a cyan box of size 51x99 starting at (68, 96) then Sets a single magenta pixel at (7, 191) then Places a magenta circle of radius 59 at center (152, 133).
; PLAN: r0=68(x), r1=96(y), r2=51(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=7(x), r6=191(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=152(x), r11=133(y), r12=59(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 68
LDI r1, 96
LDI r2, 51
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 191
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 152
LDI r11, 133
LDI r12, 59
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
