; DESCRIPTION: Places a green 71x14 rectangle at position (7, 103).
; PLAN: r0=7(x), r1=103(y), r2=71(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 103
LDI r2, 71
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
