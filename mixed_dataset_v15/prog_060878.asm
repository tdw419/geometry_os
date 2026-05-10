; DESCRIPTION: Places a green 100x30 rectangle at position (150, 208).
; PLAN: r0=150(x), r1=208(y), r2=100(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 208
LDI r2, 100
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
