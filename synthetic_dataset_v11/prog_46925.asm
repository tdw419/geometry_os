; DESCRIPTION: Places a yellow 94x71 rectangle at position (117, 171).
; PLAN: r0=117(x), r1=171(y), r2=94(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 171
LDI r2, 94
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
