; DESCRIPTION: Places a yellow 53x117 rectangle at position (169, 57).
; PLAN: r0=169(x), r1=57(y), r2=53(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 57
LDI r2, 53
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
