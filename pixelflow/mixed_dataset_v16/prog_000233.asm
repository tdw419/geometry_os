; DESCRIPTION: Composite: Places a black line segment connecting (60, 245) to (193, 137) then Renders a cyan disk with center (103, 219) and radius 24 then Renders a magenta box of size 72x54 starting at (365, 85).
; PLAN: r0=60(x1), r1=245(y1), r2=193(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=219(y), r7=24(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=365(x), r11=85(y), r12=72(width), r13=54(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 60
LDI r1, 245
LDI r2, 193
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 219
LDI r7, 24
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 365
LDI r11, 85
LDI r12, 72
LDI r13, 54
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
