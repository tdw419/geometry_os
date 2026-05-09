; DESCRIPTION: Places a black 39x101 rectangle at position (176, 146).
; PLAN: r0=176(x), r1=146(y), r2=39(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 146
LDI r2, 39
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
