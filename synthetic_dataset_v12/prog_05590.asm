; DESCRIPTION: Places a white 118x14 rectangle at position (228, 16).
; PLAN: r0=228(x), r1=16(y), r2=118(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 16
LDI r2, 118
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
