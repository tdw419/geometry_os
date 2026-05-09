; DESCRIPTION: Places a yellow 38x109 rectangle at position (385, 69).
; PLAN: r0=385(x), r1=69(y), r2=38(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 69
LDI r2, 38
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
