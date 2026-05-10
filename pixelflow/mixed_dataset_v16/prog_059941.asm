; DESCRIPTION: Places a yellow 44x113 rectangle at position (153, 126).
; PLAN: r0=153(x), r1=126(y), r2=44(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 126
LDI r2, 44
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
