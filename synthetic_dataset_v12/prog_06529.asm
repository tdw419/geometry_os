; DESCRIPTION: Composite: Renders a cyan disk with center (406, 78) and radius 13 then Places a purple dot at position (503, 149) then Renders a blue box of size 72x13 starting at (209, 57).
; PLAN: r0=406(x), r1=78(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=503(x), r6=149(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=209(x), r11=57(y), r12=72(width), r13=13(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 406
LDI r1, 78
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 503
LDI r6, 149
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 209
LDI r11, 57
LDI r12, 72
LDI r13, 13
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
