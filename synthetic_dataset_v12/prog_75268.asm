; DESCRIPTION: Places a magenta 24x28 rectangle at position (328, 170).
; PLAN: r0=328(x), r1=170(y), r2=24(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 170
LDI r2, 24
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
