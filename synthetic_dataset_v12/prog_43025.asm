; DESCRIPTION: Places a yellow 37x117 rectangle at position (154, 26).
; PLAN: r0=154(x), r1=26(y), r2=37(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 26
LDI r2, 37
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
