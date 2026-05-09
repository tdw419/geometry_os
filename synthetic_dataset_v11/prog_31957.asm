; DESCRIPTION: Places a yellow 40x40 rectangle at position (164, 52).
; PLAN: r0=164(x), r1=52(y), r2=40(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 52
LDI r2, 40
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
