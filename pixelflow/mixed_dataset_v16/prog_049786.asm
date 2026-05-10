; DESCRIPTION: Places a red 111x102 rectangle at position (196, 74).
; PLAN: r0=196(x), r1=74(y), r2=111(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 74
LDI r2, 111
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
