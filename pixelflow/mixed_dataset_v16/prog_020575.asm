; DESCRIPTION: Composite: Places a green 74x67 rectangle at position (136, 63) then Places a magenta dot at position (363, 105) then Draws a green line from (65, 196) to (38, 206).
; PLAN: r0=136(x), r1=63(y), r2=74(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=363(x), r6=105(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=65(x1), r11=196(y1), r12=38(x2), r13=206(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 63
LDI r2, 74
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 105
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 65
LDI r11, 196
LDI r12, 38
LDI r13, 206
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
