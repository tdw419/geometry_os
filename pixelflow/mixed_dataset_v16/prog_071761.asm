; DESCRIPTION: Places a black 111x72 rectangle at position (218, 0).
; PLAN: r0=218(x), r1=0(y), r2=111(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 0
LDI r2, 111
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
