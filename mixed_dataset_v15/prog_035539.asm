; DESCRIPTION: Places a blue 59x30 rectangle at position (294, 117).
; PLAN: r0=294(x), r1=117(y), r2=59(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 117
LDI r2, 59
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
