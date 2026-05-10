; DESCRIPTION: Places a red 29x45 rectangle at position (314, 173).
; PLAN: r0=314(x), r1=173(y), r2=29(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 173
LDI r2, 29
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
