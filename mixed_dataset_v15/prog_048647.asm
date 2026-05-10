; DESCRIPTION: Composite: Creates a purple rectangular region at (240, 32) spanning 79 by 62 pixels then Places a green dot at position (414, 54).
; PLAN: r0=240(x), r1=32(y), r2=79(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=414(x), r6=54(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 240
LDI r1, 32
LDI r2, 79
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 54
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
