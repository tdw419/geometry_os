; DESCRIPTION: Places a white 12x50 rectangle at position (238, 118).
; PLAN: r0=238(x), r1=118(y), r2=12(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 118
LDI r2, 12
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
