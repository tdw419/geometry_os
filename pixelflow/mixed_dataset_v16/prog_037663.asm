; DESCRIPTION: Places a green 120x23 rectangle at position (30, 65).
; PLAN: r0=30(x), r1=65(y), r2=120(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 65
LDI r2, 120
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
