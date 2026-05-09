; DESCRIPTION: Places a magenta 82x70 rectangle at position (125, 142).
; PLAN: r0=125(x), r1=142(y), r2=82(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 142
LDI r2, 82
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
