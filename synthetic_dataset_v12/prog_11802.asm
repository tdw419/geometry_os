; DESCRIPTION: Places a yellow 42x31 rectangle at position (4, 184).
; PLAN: r0=4(x), r1=184(y), r2=42(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 184
LDI r2, 42
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
