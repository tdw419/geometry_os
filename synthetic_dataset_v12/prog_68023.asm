; DESCRIPTION: Places a yellow 84x103 rectangle at position (187, 103).
; PLAN: r0=187(x), r1=103(y), r2=84(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 103
LDI r2, 84
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
