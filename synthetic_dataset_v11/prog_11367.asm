; DESCRIPTION: Renders a blue box of size 93x82 starting at (70, 103).
; PLAN: r0=70(x), r1=103(y), r2=93(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 103
LDI r2, 93
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
