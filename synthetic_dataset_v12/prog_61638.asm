; DESCRIPTION: Places a yellow 39x20 rectangle at position (116, 57).
; PLAN: r0=116(x), r1=57(y), r2=39(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 57
LDI r2, 39
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
