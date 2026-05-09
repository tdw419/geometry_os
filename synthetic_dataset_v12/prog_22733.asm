; DESCRIPTION: Places a yellow 16x70 rectangle at position (352, 165).
; PLAN: r0=352(x), r1=165(y), r2=16(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 165
LDI r2, 16
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
