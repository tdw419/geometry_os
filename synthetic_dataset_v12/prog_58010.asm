; DESCRIPTION: Places a white 56x57 rectangle at position (422, 135).
; PLAN: r0=422(x), r1=135(y), r2=56(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 135
LDI r2, 56
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
