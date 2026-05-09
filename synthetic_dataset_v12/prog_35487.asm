; DESCRIPTION: Places a yellow 98x22 rectangle at position (266, 39).
; PLAN: r0=266(x), r1=39(y), r2=98(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 39
LDI r2, 98
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
