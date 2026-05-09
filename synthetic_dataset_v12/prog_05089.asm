; DESCRIPTION: Places a green 50x52 rectangle at position (76, 14).
; PLAN: r0=76(x), r1=14(y), r2=50(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 14
LDI r2, 50
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
