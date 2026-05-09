; DESCRIPTION: Places a purple 61x14 rectangle at position (443, 138).
; PLAN: r0=443(x), r1=138(y), r2=61(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 138
LDI r2, 61
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
