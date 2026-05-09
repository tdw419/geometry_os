; DESCRIPTION: Places a yellow 61x100 rectangle at position (416, 58).
; PLAN: r0=416(x), r1=58(y), r2=61(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 58
LDI r2, 61
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
