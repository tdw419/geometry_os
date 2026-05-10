; DESCRIPTION: Composite: Places a cyan dot at position (81, 128) then Places a orange 32x104 rectangle at position (293, 117) then Renders a red line between points (476, 180) and (289, 132).
; PLAN: r0=81(x), r1=128(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=293(x), r6=117(y), r7=32(width), r8=104(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=476(x1), r11=180(y1), r12=289(x2), r13=132(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 81
LDI r1, 128
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 293
LDI r6, 117
LDI r7, 32
LDI r8, 104
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 476
LDI r11, 180
LDI r12, 289
LDI r13, 132
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
