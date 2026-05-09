; DESCRIPTION: Places a cyan 67x111 rectangle at position (39, 87).
; PLAN: r0=39(x), r1=87(y), r2=67(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 87
LDI r2, 67
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
