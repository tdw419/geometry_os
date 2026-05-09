; DESCRIPTION: Places a black 39x99 rectangle at position (70, 103).
; PLAN: r0=70(x), r1=103(y), r2=39(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 103
LDI r2, 39
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
