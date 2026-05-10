; DESCRIPTION: Composite: Places a purple 62x18 rectangle at position (288, 198) then Sets a single red pixel at (243, 37).
; PLAN: r0=288(x), r1=198(y), r2=62(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=243(x), r6=37(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 288
LDI r1, 198
LDI r2, 62
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 37
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
