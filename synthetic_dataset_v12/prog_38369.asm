; DESCRIPTION: Places a green 101x34 rectangle at position (353, 92).
; PLAN: r0=353(x), r1=92(y), r2=101(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 92
LDI r2, 101
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
