; DESCRIPTION: Composite: Places a blue 117x20 rectangle at position (272, 152) then Creates a green circular shape at (327, 61) with radius 18 then Renders a white line between points (285, 157) and (434, 210).
; PLAN: r0=272(x), r1=152(y), r2=117(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x), r6=61(y), r7=18(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=285(x1), r11=157(y1), r12=434(x2), r13=210(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 152
LDI r2, 117
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 61
LDI r7, 18
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 285
LDI r11, 157
LDI r12, 434
LDI r13, 210
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
