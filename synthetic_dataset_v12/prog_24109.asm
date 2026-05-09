; DESCRIPTION: Places a yellow 103x72 rectangle at position (112, 126).
; PLAN: r0=112(x), r1=126(y), r2=103(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 126
LDI r2, 103
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
