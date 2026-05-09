; DESCRIPTION: Places a yellow 33x99 rectangle at position (47, 19).
; PLAN: r0=47(x), r1=19(y), r2=33(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 19
LDI r2, 33
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
