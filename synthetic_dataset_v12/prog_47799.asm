; DESCRIPTION: Places a red 39x102 rectangle at position (122, 29).
; PLAN: r0=122(x), r1=29(y), r2=39(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 29
LDI r2, 39
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
