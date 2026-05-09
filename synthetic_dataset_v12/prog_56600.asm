; DESCRIPTION: Places a yellow 40x95 rectangle at position (58, 37).
; PLAN: r0=58(x), r1=37(y), r2=40(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 37
LDI r2, 40
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
