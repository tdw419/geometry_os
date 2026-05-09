; DESCRIPTION: Places a blue 113x47 rectangle at position (81, 14).
; PLAN: r0=81(x), r1=14(y), r2=113(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 14
LDI r2, 113
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
