; DESCRIPTION: Composite: Sets a single purple pixel at (243, 177) then Renders a magenta line between points (134, 48) and (65, 197) then Places a blue 13x84 rectangle at position (72, 157).
; PLAN: r0=243(x), r1=177(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=134(x1), r6=48(y1), r7=65(x2), r8=197(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=72(x), r11=157(y), r12=13(width), r13=84(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 243
LDI r1, 177
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 134
LDI r6, 48
LDI r7, 65
LDI r8, 197
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 72
LDI r11, 157
LDI r12, 13
LDI r13, 84
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
