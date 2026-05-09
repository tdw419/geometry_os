; DESCRIPTION: Composite: Places a magenta circle of radius 47 at center (63, 100) then Places a cyan dot at position (281, 150) then Creates a green rectangular region at (201, 120) spanning 79 by 116 pixels.
; PLAN: r0=63(x), r1=100(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=281(x), r6=150(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=201(x), r11=120(y), r12=79(width), r13=116(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 63
LDI r1, 100
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 281
LDI r6, 150
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 201
LDI r11, 120
LDI r12, 79
LDI r13, 116
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
