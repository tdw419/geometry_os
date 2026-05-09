; DESCRIPTION: Places a red 57x111 rectangle at position (91, 69).
; PLAN: r0=91(x), r1=69(y), r2=57(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 69
LDI r2, 57
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
