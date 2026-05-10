; DESCRIPTION: Places a green 61x30 rectangle at position (108, 161).
; PLAN: r0=108(x), r1=161(y), r2=61(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 161
LDI r2, 61
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
