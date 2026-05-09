; DESCRIPTION: Composite: Renders a yellow box of size 93x120 starting at (279, 59) then Renders a cyan disk with center (425, 109) and radius 70 then Draws a magenta line from (370, 130) to (509, 63).
; PLAN: r0=279(x), r1=59(y), r2=93(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=425(x), r6=109(y), r7=70(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=370(x1), r11=130(y1), r12=509(x2), r13=63(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 59
LDI r2, 93
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 109
LDI r7, 70
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 370
LDI r11, 130
LDI r12, 509
LDI r13, 63
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
