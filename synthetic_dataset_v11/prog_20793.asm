; DESCRIPTION: Places a white 93x111 rectangle at position (159, 129).
; PLAN: r0=159(x), r1=129(y), r2=93(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 129
LDI r2, 93
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
