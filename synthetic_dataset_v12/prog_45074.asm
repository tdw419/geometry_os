; DESCRIPTION: Places a yellow 38x120 rectangle at position (127, 26).
; PLAN: r0=127(x), r1=26(y), r2=38(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 26
LDI r2, 38
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
