; DESCRIPTION: Places a black 76x43 rectangle at position (168, 192).
; PLAN: r0=168(x), r1=192(y), r2=76(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 192
LDI r2, 76
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
