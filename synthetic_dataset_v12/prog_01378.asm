; DESCRIPTION: Places a yellow 113x54 rectangle at position (199, 118).
; PLAN: r0=199(x), r1=118(y), r2=113(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 118
LDI r2, 113
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
