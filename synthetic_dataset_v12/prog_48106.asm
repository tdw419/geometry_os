; DESCRIPTION: Places a yellow 39x92 rectangle at position (187, 157).
; PLAN: r0=187(x), r1=157(y), r2=39(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 157
LDI r2, 39
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
