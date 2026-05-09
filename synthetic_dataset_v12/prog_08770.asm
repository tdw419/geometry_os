; DESCRIPTION: Places a blue 41x82 rectangle at position (405, 96).
; PLAN: r0=405(x), r1=96(y), r2=41(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 96
LDI r2, 41
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
