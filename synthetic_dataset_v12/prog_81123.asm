; DESCRIPTION: Places a white 38x27 rectangle at position (359, 183).
; PLAN: r0=359(x), r1=183(y), r2=38(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 183
LDI r2, 38
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
