; DESCRIPTION: Places a red 14x65 box at position (121, 59).
; PLAN: r0=121(x), r1=59(y), r2=14(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 59
LDI r2, 14
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
