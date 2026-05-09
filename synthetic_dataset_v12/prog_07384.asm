; DESCRIPTION: Places a red 92x19 rectangle at position (159, 197).
; PLAN: r0=159(x), r1=197(y), r2=92(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 197
LDI r2, 92
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
