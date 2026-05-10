; DESCRIPTION: Composite: Renders a black line between points (267, 223) and (330, 52) then Places a green dot at position (32, 166) then Places a green 62x106 rectangle at position (346, 124).
; PLAN: r0=267(x1), r1=223(y1), r2=330(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=32(x), r6=166(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=346(x), r11=124(y), r12=62(width), r13=106(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 223
LDI r2, 330
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 166
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 346
LDI r11, 124
LDI r12, 62
LDI r13, 106
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
