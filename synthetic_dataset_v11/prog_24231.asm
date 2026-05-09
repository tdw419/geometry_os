; DESCRIPTION: Places a yellow 14x25 rectangle at position (165, 3).
; PLAN: r0=165(x), r1=3(y), r2=14(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 3
LDI r2, 14
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
