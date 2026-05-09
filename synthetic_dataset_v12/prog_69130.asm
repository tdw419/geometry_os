; DESCRIPTION: Places a blue 71x47 rectangle at position (184, 40).
; PLAN: r0=184(x), r1=40(y), r2=71(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 40
LDI r2, 71
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
