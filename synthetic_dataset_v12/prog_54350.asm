; DESCRIPTION: Places a yellow 51x72 rectangle at position (32, 120).
; PLAN: r0=32(x), r1=120(y), r2=51(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 120
LDI r2, 51
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
