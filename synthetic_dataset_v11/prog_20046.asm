; DESCRIPTION: Places a red 29x17 rectangle at position (68, 163).
; PLAN: r0=68(x), r1=163(y), r2=29(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 163
LDI r2, 29
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
