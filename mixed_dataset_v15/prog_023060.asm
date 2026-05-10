; DESCRIPTION: Places a black 15x104 rectangle at position (21, 17).
; PLAN: r0=21(x), r1=17(y), r2=15(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 17
LDI r2, 15
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
