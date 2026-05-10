; DESCRIPTION: Places a purple 101x17 rectangle at position (347, 154).
; PLAN: r0=347(x), r1=154(y), r2=101(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 154
LDI r2, 101
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
