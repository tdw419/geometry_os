; DESCRIPTION: Places a red 17x87 rectangle at position (228, 148).
; PLAN: r0=228(x), r1=148(y), r2=17(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 148
LDI r2, 17
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
