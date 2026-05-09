; DESCRIPTION: Places a yellow 93x113 rectangle at position (264, 126).
; PLAN: r0=264(x), r1=126(y), r2=93(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 126
LDI r2, 93
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
