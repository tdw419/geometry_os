; DESCRIPTION: Places a yellow 95x34 rectangle at position (78, 38).
; PLAN: r0=78(x), r1=38(y), r2=95(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 38
LDI r2, 95
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
