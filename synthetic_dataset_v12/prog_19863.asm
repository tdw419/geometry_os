; DESCRIPTION: Composite: Renders a orange disk with center (87, 47) and radius 42 then Renders a magenta box of size 22x23 starting at (173, 214) then Draws a cyan line from (243, 135) to (97, 66).
; PLAN: r0=87(x), r1=47(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x), r6=214(y), r7=22(width), r8=23(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=243(x1), r11=135(y1), r12=97(x2), r13=66(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 47
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 214
LDI r7, 22
LDI r8, 23
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 135
LDI r12, 97
LDI r13, 66
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
