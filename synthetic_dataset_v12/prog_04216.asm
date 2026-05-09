; DESCRIPTION: Places a yellow 113x43 rectangle at position (253, 178).
; PLAN: r0=253(x), r1=178(y), r2=113(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 178
LDI r2, 113
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
