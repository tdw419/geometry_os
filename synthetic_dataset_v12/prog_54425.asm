; DESCRIPTION: Places a red 38x69 rectangle at position (264, 106).
; PLAN: r0=264(x), r1=106(y), r2=38(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 106
LDI r2, 38
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
