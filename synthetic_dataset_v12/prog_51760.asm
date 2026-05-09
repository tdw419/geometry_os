; DESCRIPTION: Places a white 13x50 rectangle at position (196, 48).
; PLAN: r0=196(x), r1=48(y), r2=13(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 48
LDI r2, 13
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
