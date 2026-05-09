; DESCRIPTION: Places a magenta 75x28 rectangle at position (164, 204).
; PLAN: r0=164(x), r1=204(y), r2=75(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 204
LDI r2, 75
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
