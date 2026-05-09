; DESCRIPTION: Places a black 67x23 rectangle at position (215, 180).
; PLAN: r0=215(x), r1=180(y), r2=67(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 180
LDI r2, 67
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
