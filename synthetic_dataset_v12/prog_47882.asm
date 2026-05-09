; DESCRIPTION: Places a orange 51x61 rectangle at position (333, 184).
; PLAN: r0=333(x), r1=184(y), r2=51(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 184
LDI r2, 51
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
