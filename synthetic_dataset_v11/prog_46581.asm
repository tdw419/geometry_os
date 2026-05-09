; DESCRIPTION: Places a yellow 34x31 rectangle at position (54, 20).
; PLAN: r0=54(x), r1=20(y), r2=34(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 20
LDI r2, 34
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
