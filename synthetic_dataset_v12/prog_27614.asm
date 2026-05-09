; DESCRIPTION: Places a blue 75x14 rectangle at position (401, 60).
; PLAN: r0=401(x), r1=60(y), r2=75(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 60
LDI r2, 75
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
