; DESCRIPTION: Places a blue 41x38 rectangle at position (96, 87).
; PLAN: r0=96(x), r1=87(y), r2=41(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 87
LDI r2, 41
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
