; DESCRIPTION: Places a green 106x102 rectangle at position (108, 60).
; PLAN: r0=108(x), r1=60(y), r2=106(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 60
LDI r2, 106
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
