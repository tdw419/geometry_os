; DESCRIPTION: Composite: Renders a blue box of size 101x88 starting at (335, 77) then Places a cyan dot at position (425, 11) then Places a white line segment connecting (206, 181) to (503, 228).
; PLAN: r0=335(x), r1=77(y), r2=101(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=425(x), r6=11(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=206(x1), r11=181(y1), r12=503(x2), r13=228(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 335
LDI r1, 77
LDI r2, 101
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 11
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 206
LDI r11, 181
LDI r12, 503
LDI r13, 228
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
