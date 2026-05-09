; DESCRIPTION: Places a blue 72x31 rectangle at position (34, 50).
; PLAN: r0=34(x), r1=50(y), r2=72(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 50
LDI r2, 72
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
