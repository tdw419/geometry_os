; DESCRIPTION: Places a green 46x102 rectangle at position (25, 60).
; PLAN: r0=25(x), r1=60(y), r2=46(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 60
LDI r2, 46
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
