; DESCRIPTION: Places a blue 50x38 rectangle at position (187, 23).
; PLAN: r0=187(x), r1=23(y), r2=50(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 23
LDI r2, 50
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
