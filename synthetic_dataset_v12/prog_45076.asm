; DESCRIPTION: Places a yellow 70x85 rectangle at position (266, 141).
; PLAN: r0=266(x), r1=141(y), r2=70(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 141
LDI r2, 70
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
