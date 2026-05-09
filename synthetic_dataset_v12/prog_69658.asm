; DESCRIPTION: Places a yellow 108x17 rectangle at position (293, 223).
; PLAN: r0=293(x), r1=223(y), r2=108(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 223
LDI r2, 108
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
