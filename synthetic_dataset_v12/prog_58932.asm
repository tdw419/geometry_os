; DESCRIPTION: Places a yellow 11x39 rectangle at position (154, 87).
; PLAN: r0=154(x), r1=87(y), r2=11(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 87
LDI r2, 11
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
