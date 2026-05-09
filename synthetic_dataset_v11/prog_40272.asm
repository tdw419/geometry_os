; DESCRIPTION: Places a red 71x113 rectangle at position (45, 114).
; PLAN: r0=45(x), r1=114(y), r2=71(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 114
LDI r2, 71
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
