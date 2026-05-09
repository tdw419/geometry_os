; DESCRIPTION: Places a yellow 24x22 rectangle at position (38, 49).
; PLAN: r0=38(x), r1=49(y), r2=24(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 49
LDI r2, 24
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
