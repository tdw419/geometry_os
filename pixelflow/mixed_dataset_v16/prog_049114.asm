; DESCRIPTION: Places a yellow 84x33 rectangle at position (339, 214).
; PLAN: r0=339(x), r1=214(y), r2=84(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 214
LDI r2, 84
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
