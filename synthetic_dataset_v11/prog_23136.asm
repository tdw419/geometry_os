; DESCRIPTION: Places a orange 113x88 rectangle at position (51, 143).
; PLAN: r0=51(x), r1=143(y), r2=113(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 143
LDI r2, 113
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
