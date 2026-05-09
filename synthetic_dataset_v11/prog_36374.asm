; DESCRIPTION: Places a white 22x85 rectangle at position (168, 148).
; PLAN: r0=168(x), r1=148(y), r2=22(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 148
LDI r2, 22
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
