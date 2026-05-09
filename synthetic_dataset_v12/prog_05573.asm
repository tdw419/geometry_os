; DESCRIPTION: Places a purple 98x98 rectangle at position (63, 134).
; PLAN: r0=63(x), r1=134(y), r2=98(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 134
LDI r2, 98
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
