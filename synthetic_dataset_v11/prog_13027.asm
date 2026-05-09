; DESCRIPTION: Places a yellow 61x97 rectangle at position (79, 96).
; PLAN: r0=79(x), r1=96(y), r2=61(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 96
LDI r2, 61
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
