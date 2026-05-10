; DESCRIPTION: Places a yellow 53x68 rectangle at position (27, 27).
; PLAN: r0=27(x), r1=27(y), r2=53(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 27
LDI r2, 53
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
