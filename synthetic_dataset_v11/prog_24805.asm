; DESCRIPTION: Places a blue 65x50 rectangle at position (82, 101).
; PLAN: r0=82(x), r1=101(y), r2=65(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 101
LDI r2, 65
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
