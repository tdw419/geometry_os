; DESCRIPTION: Places a orange 28x74 rectangle at position (61, 107).
; PLAN: r0=61(x), r1=107(y), r2=28(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 107
LDI r2, 28
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
