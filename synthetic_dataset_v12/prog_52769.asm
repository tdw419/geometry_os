; DESCRIPTION: Composite: Creates a magenta circular shape at (78, 194) with radius 61 then Renders a cyan line between points (221, 243) and (184, 28) then Draws a cyan rectangle at (193, 8) with width 50 and height 10.
; PLAN: r0=78(x), r1=194(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=221(x1), r6=243(y1), r7=184(x2), r8=28(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=193(x), r11=8(y), r12=50(width), r13=10(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 194
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 221
LDI r6, 243
LDI r7, 184
LDI r8, 28
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 8
LDI r12, 50
LDI r13, 10
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
