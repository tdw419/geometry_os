; DESCRIPTION: Composite: Renders a cyan line between points (372, 12) and (392, 221) then Renders a white disk with center (465, 87) and radius 29 then Places a green 47x78 rectangle at position (237, 86).
; PLAN: r0=372(x1), r1=12(y1), r2=392(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=465(x), r6=87(y), r7=29(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=237(x), r11=86(y), r12=47(width), r13=78(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 372
LDI r1, 12
LDI r2, 392
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 87
LDI r7, 29
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 237
LDI r11, 86
LDI r12, 47
LDI r13, 78
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
