; DESCRIPTION: Places a yellow 102x38 rectangle at position (107, 60).
; PLAN: r0=107(x), r1=60(y), r2=102(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 60
LDI r2, 102
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
