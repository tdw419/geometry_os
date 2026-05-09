; DESCRIPTION: Places a blue 82x24 rectangle at position (45, 169).
; PLAN: r0=45(x), r1=169(y), r2=82(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 169
LDI r2, 82
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
