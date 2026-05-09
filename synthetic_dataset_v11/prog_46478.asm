; DESCRIPTION: Places a green 111x102 rectangle at position (20, 74).
; PLAN: r0=20(x), r1=74(y), r2=111(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 74
LDI r2, 111
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
