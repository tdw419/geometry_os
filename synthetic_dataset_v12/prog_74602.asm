; DESCRIPTION: Composite: Renders a yellow line between points (197, 208) and (171, 68) then Renders a blue disk with center (234, 151) and radius 74 then Places a red 42x31 rectangle at position (277, 52).
; PLAN: r0=197(x1), r1=208(y1), r2=171(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=234(x), r6=151(y), r7=74(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=277(x), r11=52(y), r12=42(width), r13=31(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 208
LDI r2, 171
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 151
LDI r7, 74
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 277
LDI r11, 52
LDI r12, 42
LDI r13, 31
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
