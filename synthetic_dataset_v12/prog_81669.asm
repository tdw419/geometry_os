; DESCRIPTION: Places a red 13x68 rectangle at position (40, 173).
; PLAN: r0=40(x), r1=173(y), r2=13(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 173
LDI r2, 13
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
