; DESCRIPTION: Places a magenta 72x117 rectangle at position (125, 43).
; PLAN: r0=125(x), r1=43(y), r2=72(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 43
LDI r2, 72
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
