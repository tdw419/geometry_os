; DESCRIPTION: Places a yellow 95x62 rectangle at position (98, 124).
; PLAN: r0=98(x), r1=124(y), r2=95(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 124
LDI r2, 95
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
