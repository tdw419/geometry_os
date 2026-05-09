; DESCRIPTION: Renders a purple box of size 72x41 starting at (151, 207).
; PLAN: r0=151(x), r1=207(y), r2=72(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 207
LDI r2, 72
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
