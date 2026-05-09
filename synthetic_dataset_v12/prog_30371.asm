; DESCRIPTION: Places a magenta 24x76 rectangle at position (341, 164).
; PLAN: r0=341(x), r1=164(y), r2=24(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 164
LDI r2, 24
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
