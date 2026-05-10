; DESCRIPTION: Composite: Places a yellow 55x104 rectangle at position (167, 112) then Places a yellow dot at position (227, 228) then Renders a yellow line between points (259, 96) and (280, 10).
; PLAN: r0=167(x), r1=112(y), r2=55(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x), r6=228(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=259(x1), r11=96(y1), r12=280(x2), r13=10(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 112
LDI r2, 55
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 228
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 259
LDI r11, 96
LDI r12, 280
LDI r13, 10
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
