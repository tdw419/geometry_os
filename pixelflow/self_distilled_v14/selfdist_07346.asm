; DESCRIPTION: Places a red 116x116 box at position (267, 172).
; PLAN: r0=267(x), r1=172(y), r2=116(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 172
LDI r2, 116
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
