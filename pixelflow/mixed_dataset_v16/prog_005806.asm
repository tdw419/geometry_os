; DESCRIPTION: Composite: Places a orange 82x98 rectangle at position (149, 98) then Sets a single magenta pixel at (226, 247) then Draws a green line from (474, 30) to (373, 221).
; PLAN: r0=149(x), r1=98(y), r2=82(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=226(x), r6=247(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=474(x1), r11=30(y1), r12=373(x2), r13=221(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 149
LDI r1, 98
LDI r2, 82
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 247
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 474
LDI r11, 30
LDI r12, 373
LDI r13, 221
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
