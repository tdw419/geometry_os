; DESCRIPTION: Places a red 39x27 rectangle at position (354, 118).
; PLAN: r0=354(x), r1=118(y), r2=39(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 118
LDI r2, 39
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
