; DESCRIPTION: Places a blue 56x76 rectangle at position (214, 135).
; PLAN: r0=214(x), r1=135(y), r2=56(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 135
LDI r2, 56
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
