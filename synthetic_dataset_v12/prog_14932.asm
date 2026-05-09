; DESCRIPTION: Places a yellow 87x17 rectangle at position (114, 177).
; PLAN: r0=114(x), r1=177(y), r2=87(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 177
LDI r2, 87
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
