; DESCRIPTION: Places a white 55x80 rectangle at position (159, 170).
; PLAN: r0=159(x), r1=170(y), r2=55(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 170
LDI r2, 55
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
