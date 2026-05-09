; DESCRIPTION: Places a green 76x30 rectangle at position (317, 153).
; PLAN: r0=317(x), r1=153(y), r2=76(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 153
LDI r2, 76
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
