; DESCRIPTION: Places a green 39x89 rectangle at position (29, 108).
; PLAN: r0=29(x), r1=108(y), r2=39(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 108
LDI r2, 39
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
