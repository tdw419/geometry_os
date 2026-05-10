; DESCRIPTION: Places a white 106x20 rectangle at position (159, 153).
; PLAN: r0=159(x), r1=153(y), r2=106(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 153
LDI r2, 106
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
