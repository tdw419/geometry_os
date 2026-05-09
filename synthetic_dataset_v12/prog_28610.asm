; DESCRIPTION: Places a black 113x111 rectangle at position (25, 108).
; PLAN: r0=25(x), r1=108(y), r2=113(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 108
LDI r2, 113
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
