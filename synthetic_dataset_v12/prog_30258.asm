; DESCRIPTION: Places a purple 40x58 rectangle at position (290, 6).
; PLAN: r0=290(x), r1=6(y), r2=40(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 6
LDI r2, 40
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
