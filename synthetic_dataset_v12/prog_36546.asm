; DESCRIPTION: Composite: Draws a blue rectangle at (33, 63) with width 11 and height 47 then Creates a magenta circular shape at (73, 213) with radius 27 then Draws a cyan line from (366, 87) to (365, 177).
; PLAN: r0=33(x), r1=63(y), r2=11(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x), r6=213(y), r7=27(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=366(x1), r11=87(y1), r12=365(x2), r13=177(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 33
LDI r1, 63
LDI r2, 11
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 213
LDI r7, 27
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 366
LDI r11, 87
LDI r12, 365
LDI r13, 177
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
