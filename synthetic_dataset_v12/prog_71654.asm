; DESCRIPTION: Composite: Renders a cyan disk with center (326, 50) and radius 25 then Renders a green box of size 85x60 starting at (93, 18) then Renders a black line between points (330, 84) and (32, 87).
; PLAN: r0=326(x), r1=50(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=93(x), r6=18(y), r7=85(width), r8=60(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=330(x1), r11=84(y1), r12=32(x2), r13=87(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 326
LDI r1, 50
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 93
LDI r6, 18
LDI r7, 85
LDI r8, 60
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 330
LDI r11, 84
LDI r12, 32
LDI r13, 87
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
