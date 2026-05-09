; DESCRIPTION: Composite: Renders a cyan disk with center (65, 204) and radius 22 then Sets a single red pixel at (384, 125) then Places a green 99x82 rectangle at position (132, 4).
; PLAN: r0=65(x), r1=204(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=384(x), r6=125(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=132(x), r11=4(y), r12=99(width), r13=82(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 65
LDI r1, 204
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 384
LDI r6, 125
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 132
LDI r11, 4
LDI r12, 99
LDI r13, 82
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
