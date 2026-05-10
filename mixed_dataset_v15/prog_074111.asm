; DESCRIPTION: Composite: Places a red 109x99 rectangle at position (123, 120) then Creates a yellow circular shape at (133, 119) with radius 11.
; PLAN: r0=123(x), r1=120(y), r2=109(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=133(x), r6=119(y), r7=11(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 123
LDI r1, 120
LDI r2, 109
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 119
LDI r7, 11
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
