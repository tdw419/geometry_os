; DESCRIPTION: Places a yellow 42x17 rectangle at position (19, 177).
; PLAN: r0=19(x), r1=177(y), r2=42(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 177
LDI r2, 42
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
