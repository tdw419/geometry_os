; DESCRIPTION: Places a yellow 39x52 rectangle at position (313, 167).
; PLAN: r0=313(x), r1=167(y), r2=39(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 167
LDI r2, 39
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
