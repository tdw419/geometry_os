; DESCRIPTION: Places a blue 71x60 rectangle at position (41, 171).
; PLAN: r0=41(x), r1=171(y), r2=71(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 171
LDI r2, 71
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
