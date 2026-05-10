; DESCRIPTION: Places a black 111x28 rectangle at position (105, 226).
; PLAN: r0=105(x), r1=226(y), r2=111(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 226
LDI r2, 111
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
