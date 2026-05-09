; DESCRIPTION: Places a white 99x25 rectangle at position (317, 183).
; PLAN: r0=317(x), r1=183(y), r2=99(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 183
LDI r2, 99
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
