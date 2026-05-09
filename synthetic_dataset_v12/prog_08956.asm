; DESCRIPTION: Composite: Places a white 88x62 rectangle at position (322, 163) then Sets a single purple pixel at (206, 36) then Renders a green line between points (303, 159) and (17, 235).
; PLAN: r0=322(x), r1=163(y), r2=88(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x), r6=36(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=303(x1), r11=159(y1), r12=17(x2), r13=235(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 322
LDI r1, 163
LDI r2, 88
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 36
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 303
LDI r11, 159
LDI r12, 17
LDI r13, 235
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
