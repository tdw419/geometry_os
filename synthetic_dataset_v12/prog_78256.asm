; DESCRIPTION: Places a yellow 51x103 rectangle at position (172, 3).
; PLAN: r0=172(x), r1=3(y), r2=51(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 3
LDI r2, 51
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
