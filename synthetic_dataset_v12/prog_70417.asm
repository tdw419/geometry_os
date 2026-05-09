; DESCRIPTION: Places a yellow 50x22 rectangle at position (94, 33).
; PLAN: r0=94(x), r1=33(y), r2=50(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 33
LDI r2, 50
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
