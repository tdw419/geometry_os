; DESCRIPTION: Composite: Places a red dot at position (376, 88) then Renders a white box of size 61x91 starting at (413, 135) then Draws a red line from (20, 13) to (173, 235).
; PLAN: r0=376(x), r1=88(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=413(x), r6=135(y), r7=61(width), r8=91(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=20(x1), r11=13(y1), r12=173(x2), r13=235(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 376
LDI r1, 88
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 413
LDI r6, 135
LDI r7, 61
LDI r8, 91
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 20
LDI r11, 13
LDI r12, 173
LDI r13, 235
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
