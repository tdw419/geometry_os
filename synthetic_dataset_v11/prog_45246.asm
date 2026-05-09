; DESCRIPTION: Places a magenta 40x19 rectangle at position (200, 197).
; PLAN: r0=200(x), r1=197(y), r2=40(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 197
LDI r2, 40
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
