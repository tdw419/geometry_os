; DESCRIPTION: Places a yellow 109x31 rectangle at position (38, 168).
; PLAN: r0=38(x), r1=168(y), r2=109(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 168
LDI r2, 109
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
