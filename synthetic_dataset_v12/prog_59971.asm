; DESCRIPTION: Places a blue 94x41 rectangle at position (315, 171).
; PLAN: r0=315(x), r1=171(y), r2=94(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 171
LDI r2, 94
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
