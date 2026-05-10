; DESCRIPTION: Places a yellow 25x29 rectangle at position (182, 47).
; PLAN: r0=182(x), r1=47(y), r2=25(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 47
LDI r2, 25
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
