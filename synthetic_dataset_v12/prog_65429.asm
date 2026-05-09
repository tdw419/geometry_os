; DESCRIPTION: Places a blue 34x92 rectangle at position (333, 31).
; PLAN: r0=333(x), r1=31(y), r2=34(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 31
LDI r2, 34
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
