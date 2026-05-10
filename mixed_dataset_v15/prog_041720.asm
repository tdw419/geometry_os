; DESCRIPTION: Places a white 71x56 rectangle at position (39, 39).
; PLAN: r0=39(x), r1=39(y), r2=71(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 39
LDI r2, 71
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
