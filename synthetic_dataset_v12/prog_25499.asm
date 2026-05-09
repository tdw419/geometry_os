; DESCRIPTION: Places a purple 41x120 rectangle at position (405, 126).
; PLAN: r0=405(x), r1=126(y), r2=41(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 126
LDI r2, 41
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
