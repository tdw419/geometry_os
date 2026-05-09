; DESCRIPTION: Places a purple 34x54 rectangle at position (342, 58).
; PLAN: r0=342(x), r1=58(y), r2=34(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 58
LDI r2, 34
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
