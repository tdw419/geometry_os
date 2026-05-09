; DESCRIPTION: Places a yellow 108x15 rectangle at position (135, 17).
; PLAN: r0=135(x), r1=17(y), r2=108(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 17
LDI r2, 108
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
