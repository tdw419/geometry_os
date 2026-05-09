; DESCRIPTION: Places a green 29x25 rectangle at position (134, 214).
; PLAN: r0=134(x), r1=214(y), r2=29(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 214
LDI r2, 29
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
