; DESCRIPTION: Places a purple 45x65 rectangle at position (242, 46).
; PLAN: r0=242(x), r1=46(y), r2=45(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 46
LDI r2, 45
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
