; DESCRIPTION: Places a red 49x59 rectangle at position (165, 177).
; PLAN: r0=165(x), r1=177(y), r2=49(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 177
LDI r2, 49
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
