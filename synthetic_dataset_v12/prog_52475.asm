; DESCRIPTION: Places a blue 32x63 rectangle at position (401, 180).
; PLAN: r0=401(x), r1=180(y), r2=32(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 180
LDI r2, 32
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
