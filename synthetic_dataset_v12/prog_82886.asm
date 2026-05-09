; DESCRIPTION: Places a red 54x43 rectangle at position (196, 182).
; PLAN: r0=196(x), r1=182(y), r2=54(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 182
LDI r2, 54
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
