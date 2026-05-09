; DESCRIPTION: Places a yellow 76x115 rectangle at position (121, 107).
; PLAN: r0=121(x), r1=107(y), r2=76(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 107
LDI r2, 76
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
