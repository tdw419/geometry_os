; DESCRIPTION: Places a yellow 70x18 rectangle at position (336, 233).
; PLAN: r0=336(x), r1=233(y), r2=70(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 233
LDI r2, 70
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
