; DESCRIPTION: Places a yellow 73x61 rectangle at position (307, 169).
; PLAN: r0=307(x), r1=169(y), r2=73(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 169
LDI r2, 73
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
