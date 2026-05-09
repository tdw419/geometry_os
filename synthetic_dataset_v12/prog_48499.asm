; DESCRIPTION: Places a yellow 53x47 rectangle at position (181, 142).
; PLAN: r0=181(x), r1=142(y), r2=53(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 142
LDI r2, 53
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
