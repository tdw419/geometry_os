; DESCRIPTION: Places a yellow 120x19 rectangle at position (102, 184).
; PLAN: r0=102(x), r1=184(y), r2=120(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 184
LDI r2, 120
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
