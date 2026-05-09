; DESCRIPTION: Composite: Places a cyan 116x104 rectangle at position (228, 123) then Renders a purple line between points (128, 76) and (56, 142) then Places a cyan dot at position (240, 215).
; PLAN: r0=228(x), r1=123(y), r2=116(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=128(x1), r6=76(y1), r7=56(x2), r8=142(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=240(x), r11=215(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 228
LDI r1, 123
LDI r2, 116
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 76
LDI r7, 56
LDI r8, 142
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 240
LDI r11, 215
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
