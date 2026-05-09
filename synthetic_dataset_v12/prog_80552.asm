; DESCRIPTION: Places a green 30x59 rectangle at position (317, 14).
; PLAN: r0=317(x), r1=14(y), r2=30(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 14
LDI r2, 30
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
