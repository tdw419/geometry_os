; DESCRIPTION: Places a red 113x17 rectangle at position (96, 206).
; PLAN: r0=96(x), r1=206(y), r2=113(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 206
LDI r2, 113
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
