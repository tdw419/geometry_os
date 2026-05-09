; DESCRIPTION: Places a orange 38x112 rectangle at position (51, 139).
; PLAN: r0=51(x), r1=139(y), r2=38(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 139
LDI r2, 38
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
