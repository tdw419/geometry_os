; DESCRIPTION: Places a yellow 111x38 rectangle at position (66, 148).
; PLAN: r0=66(x), r1=148(y), r2=111(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 148
LDI r2, 111
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
