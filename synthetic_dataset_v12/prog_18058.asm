; DESCRIPTION: Places a blue 45x27 rectangle at position (326, 82).
; PLAN: r0=326(x), r1=82(y), r2=45(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 82
LDI r2, 45
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
