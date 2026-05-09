; DESCRIPTION: Places a blue 61x43 rectangle at position (96, 117).
; PLAN: r0=96(x), r1=117(y), r2=61(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 117
LDI r2, 61
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
