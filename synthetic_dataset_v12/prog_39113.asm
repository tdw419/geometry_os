; DESCRIPTION: Places a red 17x46 rectangle at position (291, 143).
; PLAN: r0=291(x), r1=143(y), r2=17(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 143
LDI r2, 17
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
