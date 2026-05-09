; DESCRIPTION: Places a red 13x19 rectangle at position (81, 164).
; PLAN: r0=81(x), r1=164(y), r2=13(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 164
LDI r2, 13
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
