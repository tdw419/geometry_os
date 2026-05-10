; DESCRIPTION: Places a yellow 39x19 rectangle at position (24, 38).
; PLAN: r0=24(x), r1=38(y), r2=39(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 38
LDI r2, 39
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
