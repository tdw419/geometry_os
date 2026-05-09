; DESCRIPTION: Places a blue 32x31 rectangle at position (180, 117).
; PLAN: r0=180(x), r1=117(y), r2=32(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 117
LDI r2, 32
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
