; DESCRIPTION: Places a yellow 38x26 rectangle at position (27, 5).
; PLAN: r0=27(x), r1=5(y), r2=38(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 5
LDI r2, 38
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
