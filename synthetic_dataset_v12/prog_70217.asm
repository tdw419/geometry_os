; DESCRIPTION: Places a yellow 89x71 rectangle at position (218, 145).
; PLAN: r0=218(x), r1=145(y), r2=89(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 145
LDI r2, 89
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
