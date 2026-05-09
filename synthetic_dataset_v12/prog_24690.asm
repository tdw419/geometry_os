; DESCRIPTION: Places a yellow 39x31 rectangle at position (120, 40).
; PLAN: r0=120(x), r1=40(y), r2=39(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 40
LDI r2, 39
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
