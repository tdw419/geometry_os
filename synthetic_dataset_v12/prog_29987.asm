; DESCRIPTION: Places a white 118x50 rectangle at position (355, 60).
; PLAN: r0=355(x), r1=60(y), r2=118(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 60
LDI r2, 118
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
