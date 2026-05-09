; DESCRIPTION: Places a yellow 51x19 rectangle at position (205, 16).
; PLAN: r0=205(x), r1=16(y), r2=51(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 16
LDI r2, 51
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
