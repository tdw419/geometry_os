; DESCRIPTION: Composite: Places a black 116x30 rectangle at position (29, 35) then Places a black dot at position (275, 228) then Renders a red line between points (377, 7) and (151, 52).
; PLAN: r0=29(x), r1=35(y), r2=116(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=228(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=377(x1), r11=7(y1), r12=151(x2), r13=52(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 29
LDI r1, 35
LDI r2, 116
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 228
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 377
LDI r11, 7
LDI r12, 151
LDI r13, 52
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
