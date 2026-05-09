; DESCRIPTION: Places a yellow 82x31 rectangle at position (206, 42).
; PLAN: r0=206(x), r1=42(y), r2=82(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 42
LDI r2, 82
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
