; DESCRIPTION: Places a yellow 84x38 rectangle at position (289, 115).
; PLAN: r0=289(x), r1=115(y), r2=84(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 115
LDI r2, 84
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
