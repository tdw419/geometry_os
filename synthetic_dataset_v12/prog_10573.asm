; DESCRIPTION: Places a purple 11x60 rectangle at position (443, 7).
; PLAN: r0=443(x), r1=7(y), r2=11(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 7
LDI r2, 11
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
