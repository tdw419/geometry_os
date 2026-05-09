; DESCRIPTION: Places a yellow 14x38 rectangle at position (236, 172).
; PLAN: r0=236(x), r1=172(y), r2=14(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 172
LDI r2, 14
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
