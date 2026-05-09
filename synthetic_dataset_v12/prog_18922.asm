; DESCRIPTION: Places a green 42x10 rectangle at position (403, 185).
; PLAN: r0=403(x), r1=185(y), r2=42(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 185
LDI r2, 42
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
