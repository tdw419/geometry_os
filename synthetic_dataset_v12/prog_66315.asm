; DESCRIPTION: Places a black 97x59 rectangle at position (173, 117).
; PLAN: r0=173(x), r1=117(y), r2=97(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 117
LDI r2, 97
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
