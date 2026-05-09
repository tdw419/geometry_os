; DESCRIPTION: Places a red 47x52 rectangle at position (111, 28).
; PLAN: r0=111(x), r1=28(y), r2=47(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 28
LDI r2, 47
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
