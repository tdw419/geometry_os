; DESCRIPTION: Places a yellow 75x109 rectangle at position (361, 136).
; PLAN: r0=361(x), r1=136(y), r2=75(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 136
LDI r2, 75
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
