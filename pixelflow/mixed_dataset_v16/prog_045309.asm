; DESCRIPTION: Places a purple 60x111 rectangle at position (428, 41).
; PLAN: r0=428(x), r1=41(y), r2=60(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 41
LDI r2, 60
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
