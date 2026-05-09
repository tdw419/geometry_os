; DESCRIPTION: Places a white 39x113 rectangle at position (211, 117).
; PLAN: r0=211(x), r1=117(y), r2=39(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 117
LDI r2, 39
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
