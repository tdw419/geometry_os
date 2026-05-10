; DESCRIPTION: Places a yellow 93x10 box at position (246, 169).
; PLAN: r0=246(x), r1=169(y), r2=93(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 169
LDI r2, 93
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
