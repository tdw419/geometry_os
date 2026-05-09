; DESCRIPTION: Places a yellow 35x27 rectangle at position (182, 31).
; PLAN: r0=182(x), r1=31(y), r2=35(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 31
LDI r2, 35
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
