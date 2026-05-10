; DESCRIPTION: Places a green 38x119 rectangle at position (102, 83).
; PLAN: r0=102(x), r1=83(y), r2=38(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 83
LDI r2, 38
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
