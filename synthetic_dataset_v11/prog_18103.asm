; DESCRIPTION: Places a yellow 113x11 rectangle at position (98, 121).
; PLAN: r0=98(x), r1=121(y), r2=113(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 121
LDI r2, 113
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
