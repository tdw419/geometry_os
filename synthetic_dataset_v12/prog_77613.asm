; DESCRIPTION: Places a black 113x33 rectangle at position (352, 18).
; PLAN: r0=352(x), r1=18(y), r2=113(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 18
LDI r2, 113
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
