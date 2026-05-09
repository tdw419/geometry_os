; DESCRIPTION: Places a red 22x30 rectangle at position (228, 133).
; PLAN: r0=228(x), r1=133(y), r2=22(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 133
LDI r2, 22
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
