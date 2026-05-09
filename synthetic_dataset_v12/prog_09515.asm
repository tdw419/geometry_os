; DESCRIPTION: Places a yellow 25x85 rectangle at position (96, 165).
; PLAN: r0=96(x), r1=165(y), r2=25(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 165
LDI r2, 25
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
