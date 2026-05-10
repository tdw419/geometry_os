; DESCRIPTION: Composite: Places a white 75x12 rectangle at position (72, 196) then Sets a single green pixel at (64, 21) then Renders a orange line between points (493, 219) and (365, 82).
; PLAN: r0=72(x), r1=196(y), r2=75(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=64(x), r6=21(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=493(x1), r11=219(y1), r12=365(x2), r13=82(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 72
LDI r1, 196
LDI r2, 75
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 21
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 493
LDI r11, 219
LDI r12, 365
LDI r13, 82
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
