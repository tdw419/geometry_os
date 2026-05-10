; DESCRIPTION: Places a yellow 93x57 rectangle at position (104, 108).
; PLAN: r0=104(x), r1=108(y), r2=93(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 108
LDI r2, 93
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
