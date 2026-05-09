; DESCRIPTION: Places a red 23x82 rectangle at position (146, 121).
; PLAN: r0=146(x), r1=121(y), r2=23(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 121
LDI r2, 23
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
