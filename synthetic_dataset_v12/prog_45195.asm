; DESCRIPTION: Places a blue 68x50 rectangle at position (171, 77).
; PLAN: r0=171(x), r1=77(y), r2=68(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 77
LDI r2, 68
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
