; DESCRIPTION: Places a blue 79x45 rectangle at position (182, 126).
; PLAN: r0=182(x), r1=126(y), r2=79(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 126
LDI r2, 79
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
