; DESCRIPTION: Composite: Renders a cyan line between points (345, 215) and (34, 145) then Renders a orange disk with center (239, 171) and radius 35 then Places a cyan 111x118 rectangle at position (326, 48).
; PLAN: r0=345(x1), r1=215(y1), r2=34(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=171(y), r7=35(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=326(x), r11=48(y), r12=111(width), r13=118(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 215
LDI r2, 34
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 171
LDI r7, 35
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 326
LDI r11, 48
LDI r12, 111
LDI r13, 118
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
