; DESCRIPTION: Places a magenta 24x16 rectangle at position (131, 195).
; PLAN: r0=131(x), r1=195(y), r2=24(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 195
LDI r2, 24
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
